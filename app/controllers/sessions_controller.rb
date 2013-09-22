class SessionsController < ApplicationController
  respond_to :json, :html

  def create
    if User.find_by_username(params[:username])
      @user = User.find_by_username(params[:username])
      if @user.authenticate(params[:password])
        login(@user)
        # render :partial => 'layouts/navbar', layout: false
        render :json => render_to_string(:partial => 'layouts/navbar').to_json
      else
        @errors = "Username/password combination was incorrect. Please try again."
        render :json => render_to_string(:partial => 'layouts/errors', :locals => {:errors => @errors}).to_json, :status => :unprocessable_entity
      end
    else
      @errors = "User #{params[:username]} does not exist. Please try again."
      render :json => render_to_string(:partial => 'layouts/errors', :locals => {:errors => @errors}).to_json, :status => :unprocessable_entity
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
