class ChatController < ApplicationController
    before_action :get_access

    def index
        @contacts = User.other_users(current_user.id)
    end
end
