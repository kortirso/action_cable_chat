class MessagesController < ApplicationController
    before_action :get_access

    def create
        message = Message.create(message_params)
    end

    private
    def message_params
        params.require(:message).permit(:body, :room_id, :user_id)
    end
end
