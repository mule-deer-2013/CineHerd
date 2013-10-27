class RemoveRootandParentFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :parent_id
    remove_column :posts, :root_id
  end

  def down
    add_column :posts, :parent_id, :integer
    add_column :posts, :root_id, :integer
  end
end
