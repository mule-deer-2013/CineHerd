class AddIndexToThreeVoteFields < ActiveRecord::Migration
  def change
    add_index :votes, :user_id
    add_index :votes, :votable_type
    add_index :votes, :votable_id
  end
end
