class CreateRoots < ActiveRecord::Migration
  def change
    create_table :roots do |t|
      t.references :user
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
