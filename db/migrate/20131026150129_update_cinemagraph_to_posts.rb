class UpdateCinemagraphToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :extension, :string
  end

  def down
    add_column :posts, :extension, :string
  end

  def self.up
    add_attachment :posts, :cinemagraph
  end

  def self.down
    remove_attachment :posts, :cinemagraph
  end
end
