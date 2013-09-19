class UsersController < ApplicationController

  include SessionsHelper

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
    login(@user)
    redirect_to root_path
  end


end
