class User < ActiveRecord::Base

  attr_accessible :email, :username, :password
  has_many :posts
  has_many :comments
  has_many :votes
  has_secure_password

  validates_presence_of :username, :email, :password

  include BCrypt

end
