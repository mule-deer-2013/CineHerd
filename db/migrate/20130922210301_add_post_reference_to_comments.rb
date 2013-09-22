class AddPostReferenceToComments < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer, references: :posts
  end
end
