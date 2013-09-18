class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :parent_id, :root_id, :title, :user_id

end
