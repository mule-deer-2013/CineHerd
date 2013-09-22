class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.create(params[:comment])
    @comment.user = current_user
    @comment.parent_id = params[:post_id]
    post.comments << @comment

    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      #puts @comment.errors.full_messages
      render "new"
    end
  end
end
