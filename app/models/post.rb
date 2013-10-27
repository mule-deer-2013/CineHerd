class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :as => :votable
  has_many :comments

  attr_accessible :content, :title, :user, :cinemagraph
  has_attached_file :cinemagraph, :styles => { :medium => "600x400>"}

  #add paperclip validations for content type, size, attachment presence
  validates_presence_of :content, :title, :user
  validates_uniqueness_of :title
end
