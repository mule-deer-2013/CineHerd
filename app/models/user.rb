require 'bcrypt'

class User < ActiveRecord::Base

  attr_accessible :email, :password_hash, :username, :password
  has_many :posts

  validates :username, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(password)
    if self.password == password
      true
    else
      false
    end
  end

end
