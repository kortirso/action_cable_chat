module ApplicationHelper
    def gravatar_for(user_name, user_email, opts = {})
        opts[:alt] = user_name
        opts[:class] = 'gravatar'
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user_email)}?s=#{opts.delete(:size) { 30 }}",
              opts
    end
end
