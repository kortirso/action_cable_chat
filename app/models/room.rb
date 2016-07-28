class Room < ApplicationRecord
    has_many :roommates
    has_many :users, through: :roommates
    has_many :messages

    def with_user(user_id)
        self.roommates.where.not(user_id: user_id).first.user.username
    end
end
