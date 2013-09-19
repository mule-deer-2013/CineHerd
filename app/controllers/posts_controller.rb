class PostsController < ApplicationController

include SessionsHelper

  def index
    @user = current_user || User.new
    @questions = Post.where(parent_id: nil)
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = 1
      if @post.save
        redirect_to root_path
      else
        redirect_to new_post_path
      end
  end

  def show
    @question = Post.find(params[:id])
    @answers = Post.where(:parent_id => params[:id]).where(:root_id => params[:id]).where(:parent_id => !nil)
    @comments = Post.where(:root_id => params[:id]).where(:parent_id != :root_id)
  end

end
