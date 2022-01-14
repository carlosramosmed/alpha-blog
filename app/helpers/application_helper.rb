module ApplicationHelper
  require 'digest/md5'

  def gravatar_for user
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_for = "https://www.gravatar.com/avatar/#{hash}"
    image_tag(gravatar_for, alt: user.username)
  end
end
