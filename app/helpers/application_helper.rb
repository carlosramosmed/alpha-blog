module ApplicationHelper
  # these methods are available to views only!
  def gravatar_for (user, options = { size: 80 })
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_for = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_for, alt: user.username, class: "rounded shadow mx-auto d-block mb-4")
  end

  def alert_classname name
    if (name == "notice")
      "success"
    else
      "danger"
    end
  end

end
