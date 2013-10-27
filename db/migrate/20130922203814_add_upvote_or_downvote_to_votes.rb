class AddUpvoteOrDownvoteToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :upvote_or_downvote, :boolean
  end
end
