module UsersHelper

  def avatar_tag(user, width = 96)
    if user.avatar?
      avatar_url = user.avatar.url
    else
      avatar_id = Digest::MD5::hexdigest(user.email.downcase)
      avatar_url = "https://secure.gravatar.com/avatar/#{avatar_id}"
    end
    image_tag(avatar_url, alt: user.username, class: "avatar-#{width}")
  end
end
