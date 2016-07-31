class Room < ApplicationRecord
    has_many :roommates, dependent: :destroy
    has_many :users, through: :roommates
    has_many :messages, dependent: :destroy

    def with_user(user_id)
        self.roommates.where.not(user_id: user_id).first.user
    end

    def self.build(*users)
        Room.create.create_roommates(users) if Roommate.find_by(user_id: users[0], contact_id: users[1]).nil?
    end

    def create_roommates(users)
        users.each_with_index do |u, index|
            user = User.find(users[1 - index])
            self.roommates.create user_id: u, contact_id: users[1 - index]
            ActionCable.server.broadcast "users_#{u}_channel", username: user.username, email: Digest::MD5.hexdigest(user.email), room: self.id
        end
    end
end
