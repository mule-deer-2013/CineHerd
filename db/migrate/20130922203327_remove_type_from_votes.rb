class RemoveTypeFromVotes < ActiveRecord::Migration
  def up
    remove_column :votes, :type
  end

  def down
    add_column :votes, :type
  end
end
