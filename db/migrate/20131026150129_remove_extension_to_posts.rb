class RemoveExtensionToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :extension
  end

  def down
    add_column :posts, :extension, :string
  end
end
