class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
      if @post.save
        redirect_to post_path(@post)
      else
        @errors = @post.errors.full_messages
        redirect_to new_post_path
      end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

end

