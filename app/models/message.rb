class Message < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :user_id, :room_id, :body, presence: true
    validates :body, length: { minimum: 1 }

    after_create :send_message

    def timestamp
        created_at.strftime('%H:%M')
    end

    private
    
    def send_message
        ActionCable.server.broadcast "rooms_#{self.room_id}_channel", message: self.body, user: self.user.username, time: self.timestamp
    end
end
