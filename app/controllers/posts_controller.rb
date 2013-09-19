class PostsController < ActionController::Base

  def index
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

end

