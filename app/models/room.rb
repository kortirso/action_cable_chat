class Room < ApplicationRecord
    has_many :roommates, dependent: :destroy
    has_many :users, through: :roommates
    has_many :messages, dependent: :destroy

    def with_user(user_id)
        self.roommates.where.not(user_id: user_id).first.user
    end

    def self.build(user_id, friend_id)
        room = Room.create
        room.create_roommates(user_id, friend_id)
        room.send_messages(user_id, friend_id)
    end

    def create_roommates(*users)
        users.each { |user| self.roommates.create user_id: user }
    end

    def send_messages(*users)
        user = User.find(users[0])
        friend = User.find(users[1])
        ActionCable.server.broadcast "users_#{users[0]}_channel", username: friend.username, email: Digest::MD5.hexdigest(friend.email), room: self.id
        ActionCable.server.broadcast "users_#{users[1]}_channel", username: user.username, email: Digest::MD5.hexdigest(user.email), room: self.id
    end
end
