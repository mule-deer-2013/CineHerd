class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true
  belongs_to :user

  attr_accessible :upvote_or_downvote, :user_id, :votable_type, :votable_id
  validates_presence_of :votable_type, :votable_id, :user_id
  validates_inclusion_of :upvote_or_downvote, :in => [true, false]

  def up?
    self.upvote_or_downvote?
  end

  def down?
    !self.upvote_or_downvote?
  end
end
