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

    if params[:question]
      q = params[:question]
      @post = Post.new(
        params[:post],
        root_id: q,
        parent_id: q,
        user_id: current_user.id
      )
      @post.save
      redirect_to root_path and return
    end

    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end

  end

  def show
    p params
    p "X"*90
    # find the question for the page we're visiting
    @question = Post.find(params[:id])
    # return an array of Post objects whose parent is the question, found by ID
    @answers = Post.where(:parent_id => params[:id]).where(:root_id => params[:id]).where(:parent_id => !nil)
    # Return ALL answers for a question, regardless of Answer association. (They get parsed with a helper method in ApplicationContorller)
    @comments = Post.where(:root_id => params[:id]).where(:parent_id != :root_id)
  end

end
