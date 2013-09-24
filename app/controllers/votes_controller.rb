class VotesController < ApplicationController
  def create

  end

  def createup
    @vote = Vote.new(upvote_or_downvote: true, votable_id: params[:post], votable_type: "Post", user_id: current_user.id )
    begin
      flash[:error] = @vote.errors.full_messages unless @vote.save
    rescue
    end
    if params[:location] == 'index'
        redirect_to post_path(params[:post])
    else
      redirect_to root_path
    end
  end

  def createdown
    @vote = Vote.new(upvote_or_downvote: false, votable_id: params[:post], votable_type: "post", user_id: current_user.id )
    begin
      flash[:error] = @vote.errors.full_messages unless @vote.save
    rescue
    end
    if params[:location] == 'index'
      redirect_to post_path(params[:post])
    else
      redirect_to root_path
    end
  end

end
