class AddCinemgraphExtToPost < ActiveRecord::Migration
  def change
    add_column :posts, :extension, :string
  end
end
