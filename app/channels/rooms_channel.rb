class RoomsChannel < ApplicationCable::Channel  
    def subscribed
        stream_from "rooms_#{params['room_id']}_channel"
    end
end