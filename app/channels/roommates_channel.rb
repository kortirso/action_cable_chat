class RoommatesChannel < ApplicationCable::Channel  
    def subscribed
        stream_from "users_#{params['user_id']}_channel"
    end
end