class SessionsController < ApplicationController

  include SessionsHelper

  def create
    if User.find_by_username(params[:username])
      @user = User.find_by_username(params[:username])
      if @user.authenticate(params[:password])
        login(@username)
        redirect_to root_path
      else
        # redirect somewhere with login error message
      end
    else
      # redirect somewhere with user-does-not-exist message
    end
  end

  def destroy
    session.clear
  end
  
end
