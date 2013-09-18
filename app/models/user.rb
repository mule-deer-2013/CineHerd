class User < ActiveRecord::Base
  attr_accessible :email, :password_hash, :username
  has_many :posts
end
