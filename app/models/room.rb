class Room < ApplicationRecord
    has_many :roommates, dependent: :destroy
    has_many :users, through: :roommates
    has_many :messages, dependent: :destroy

    def with_user(user_id)
        self.roommates.where.not(user_id: user_id).first.user
    end
end
