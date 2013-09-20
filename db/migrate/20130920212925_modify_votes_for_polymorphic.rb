class ModifyVotesForPolymorphic < ActiveRecord::Migration
  def up
    remove_column :votes, :user_id
    remove_column :votes, :post_id
  end

  def down
    add_column :votes, :user_id
    add_column :votes, :post_id
    add_index :votes, :user_id
    add_index :votes, :post_id
  end
end
