class Comment < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :title
  validates_presence_of :title, :content, :user_id, :parent_id, :root_id
  attr_accessible :title, :content
end
