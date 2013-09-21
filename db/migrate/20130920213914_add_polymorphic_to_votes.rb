class AddPolymorphicToVotes < ActiveRecord::Migration
  def self.up
    change_table :votes do |t|
      t.references :votable, polymorphic: true
    end
  end

  def self.down
    change_table :votes do |t|
      t.remove_references :votable, polymorphic: true
    end
  end
end
