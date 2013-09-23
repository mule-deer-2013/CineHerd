class VotesController < ApplicationController
  
  def createup
    @vote = Vote.create(upvote_or_downvote: true, votable_id: params[:post], votable_type: "post", user_id: current_user.id )
    puts @vote.errors.full_messages unless @vote.save

    redirect_to root_path
  end

  def createdown
    @vote = Vote.create(upvote_or_downvote: false, votable_id: params[:post], votable_type: "post", user_id: current_user.id )
    puts @vote.errors.full_messages unless @vote.save

    redirect_to root_path
  end

end
