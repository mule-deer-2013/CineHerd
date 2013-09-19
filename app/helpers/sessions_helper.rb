module SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    true if current_user
  end

end
