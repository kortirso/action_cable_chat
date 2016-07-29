class Message < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :user_id, :room_id, :body, presence: true
    validates :body, length: { minimum: 1 }
end
