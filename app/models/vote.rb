class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :type
end
