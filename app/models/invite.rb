class Invite < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: 'User'

    validates :user_id, :friend_id, presence: true

    after_create :send_message

    private

    def send_message
        ActionCable.server.broadcast "invites_#{self.friend_id}_channel", invite: self.id, user_id: self.friend_id, friendname: User.find(self.user_id).username
    end
end
