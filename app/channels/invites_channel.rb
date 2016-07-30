class InvitesChannel < ApplicationCable::Channel  
    def subscribed
        stream_from "invites_#{params['user_id']}_channel"
    end
end