class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :title
  validates_presence_of :title, :content, :user, :parent_id, :root_id
  attr_accessible :title, :content
end
