$(function() {
    user = $('#user');

    App.messages = App.cable.subscriptions.create({ channel: 'RoommatesChannel', user_id: user.data('owner') }, {
        received: function(data) {
            $('.contacts_block').append(this.renderMessage(data));
        },

        renderMessage: function(data) {
            return '<p><img alt="' + data.username + '" class="gravatar" src="https://www.gravatar.com/avatar/' + data.email + '?s=30"><a data-turbolinks="false" href="/rooms/'+ data.room + '">' + data.username + '</a></p>';
        }
    });
});


