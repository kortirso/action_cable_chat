class MessagesController < ApplicationController
    before_action :get_access

    def create
        message = Message.create(message_params)
        ActionCable.server.broadcast "rooms_#{params['message']['room_id']}_channel", message: message.body, user: message.user.username, time: message.created_at.strftime('%H:%M')
        head :ok
    end

    private
    def message_params
        params.require(:message).permit(:body, :room_id, :user_id)
    end
end
