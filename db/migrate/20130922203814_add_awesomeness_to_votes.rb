class AddAwesomenessToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :awesomeness, :boolean
  end
end
