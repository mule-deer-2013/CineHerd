class AddAttachmentCinemagraphToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :cinemagraph
    end
  end

  def self.down
    drop_attached_file :posts, :cinemagraph
  end
end
