class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.string :title
      t.text :content
      t.integer :parent_id
      t.integer :root_id

      t.timestamps
    end

    add_index :comments, :user_id
  end
end
