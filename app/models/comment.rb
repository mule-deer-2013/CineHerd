class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :as => :votable
  belongs_to :post
  validates_uniqueness_of :content
  validates_presence_of :content, :user, :parent_id, :root_id
  attr_accessible :content, :user_id, :root_id, :parent_id
end
