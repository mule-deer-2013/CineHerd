module UsersHelper
  require 'digest'

  def gravatar_for(user)
    grav_id = Digest::MD5.hexdigest(user.email.downcase)
    grav_link = "http://gravatar.com/avatar/#{grav_id}?s=50"
  end
end
