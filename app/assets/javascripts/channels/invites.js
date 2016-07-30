$(function() {
    user = $('#user');

    App.messages = App.cable.subscriptions.create({ channel: 'InvitesChannel', user_id: user.data('owner') }, {
        received: function(data) {
            $('.invites_block').append(this.renderMessage(data));
        },

        renderMessage: function(data) {
            return '<div class="invite" id="invite_' + data.invite + '"><p>' + data.friendname + '</p><form class="create_button" action="/invites/accept" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="user_id" id="user_id" value="' + data.user_id + '"><input type="hidden" name="invite_id" id="invite_id" value="' + data.invite + '"><input type="hidden" name="accept" id="accept" value="true"><input type="submit" name="commit" value="" class="submit" data-turbolinks="false" data-disable-with=""></form><form class="cancel_button" action="/invites/accept" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="user_id" id="user_id" value="' + data.user_id + '"><input type="hidden" name="invite_id" id="invite_id" value="' + data.invite + '"><input type="submit" name="commit" value="" class="submit" data-turbolinks="false" data-disable-with=""></form></div>';
        }
    });
});


