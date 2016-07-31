class InvitesController < ApplicationController
    before_action :get_access
    before_action :search_friend, only: :search
    before_action :search_invite, only: :accept

    def search
        @user = params[:user_id]
    end

    def create
        Invite.create user_id: params[:user_id], friend_id: params[:friend] unless params[:user_id].nil?
    end

    def accept
        Room.build(@invite.user_id, @invite.friend_id) unless params[:accept].nil?
        @invite.destroy
    end

    private

    def search_friend
        @friend = User.find_by(username: params[:username])
        head :ok if @friend.nil? || current_user.have_friend?(@friend.id)
    end

    def search_invite
        @invite = Invite.find_by(id: params[:invite_id])
        head :ok if @invite.nil?
    end
end
