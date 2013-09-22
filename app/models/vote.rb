class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true
  belongs_to :user
  attr_accessible :awesomeness
  validates_presence_of :votable_type, :votable_id, :user_id, :awesomeness
end
