class UsersController < ApplicationController

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  
end
