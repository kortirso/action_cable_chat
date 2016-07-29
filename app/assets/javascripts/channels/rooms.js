$(function() {
    messages = $('#messages');

    App.messages = App.cable.subscriptions.create({ channel: 'RoomsChannel', room_id: messages.data('room') }, {
        received: function(data) {
            $('#message_body').val('');
            return $('#messages').append(this.renderMessage(data, messages.data('owner')));
        },

        renderMessage: function(data, ownerName) {
            if(ownerName == data.user) {
                owner = 'users';
            }
            else {
                owner = 'roommates';
            }
            return "<div class='message " + owner + "'><p class='author'>" + data.user + "</p><div class='body'><span class='time'>" + data.time + "</span><div class='text'>" + data.message + "</div></div></div>";
        }
    });
});