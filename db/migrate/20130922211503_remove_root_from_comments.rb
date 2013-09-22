class RemoveRootFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :root_id
  end

  def down
    add_column :comments, :root_id, :integer
  end
end
