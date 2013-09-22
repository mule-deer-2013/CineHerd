class ApplicationController < ActionController::Base
  protect_from_forgery

  include Authentication #see lib

  helper_method :current_user, :logged_in?
end
