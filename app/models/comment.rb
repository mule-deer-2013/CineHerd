class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :content
  validates_presence_of :content, :user, :parent_id, :root_id
  attr_accessible :content
end
