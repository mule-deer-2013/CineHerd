class VotesController < ApplicationController

  def createup
    @vote = Vote.create(upvote_or_downvote: true, votable_id: params[:post], votable_type: "post", user_id: current_user.id )
    flash[:error] = @vote.errors.full_messages unless @vote.save

    if params[:location] == 'index'
      redirect_to post_path(params[:post])
    else
      redirect_to root_path
    end
  end

  def createdown
    @vote = Vote.create(upvote_or_downvote: false, votable_id: params[:post], votable_type: "post", user_id: current_user.id )
    flash[:error] = @vote.errors.full_messages unless @vote.save

    if params[:location] == 'index'
      redirect_to post_path(params[:post])
    else
      redirect_to root_path
    end
  end

end
