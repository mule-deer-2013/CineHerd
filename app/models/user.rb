
class User < ActiveRecord::Base

  attr_accessible :email, :username, :password
  has_many :posts
  has_secure_password

  validates :username, presence: true

  include BCrypt

end
