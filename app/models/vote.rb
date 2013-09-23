class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true
  belongs_to :user

  attr_accessible :upvote_or_downvote, :user_id, :votable_type, :votable_id
  validates_presence_of :votable_type, :votable_id, :user_id, :upvote_or_downvote

  def self.vote_count(type, id)
    self.vote_up(type, id) - self.vote_down(type, id)
  end

  protected

  def self.vote_up(type, id)
    self.where(votable_type: type, votable_id: id, upvote_or_downvote: true).size
  end

  def self.vote_down(type, id)
    self.where(votable_type: type, votable_id: id, upvote_or_downvote: false).size
  end
end
