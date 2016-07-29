class RoomsController < ApplicationController
    before_action :get_access
    before_action :get_contacts_list
    before_action :get_room, only: :show

    def index
        
    end

    def show
        @messages = @room.messages.includes(:user).order(id: :asc)
    end

    private
    def get_room
        @room = current_user.rooms.find_by(id: params[:id])
        render template: 'shared/404', status: 404 if @room.nil?
    end
end
