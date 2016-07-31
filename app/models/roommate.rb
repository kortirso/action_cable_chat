class Roommate < ApplicationRecord
    belongs_to :user
    belongs_to :room
    belongs_to :contact, class_name: 'User'

    validates :user_id, :room_id, :contact_id, presence: true
end
