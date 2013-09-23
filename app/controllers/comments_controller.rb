class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    render partial: "form"
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(params[:comment])
    @comment.user = current_user
    @comment.parent_id = params[:post_id]
    @post.comments << @comment

    if @comment.save
      render :json => render_to_string(:locals => {comment: @comment, post: @post} )
    else
      'not saving'
    end
  end
end
