class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :parent_id, :root_id, :title, :user_id
  validates_presence_of :content, :title, :user_id
  validates_uniqueness_of :title


end
