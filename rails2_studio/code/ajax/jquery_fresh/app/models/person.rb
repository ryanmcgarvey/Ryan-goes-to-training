class Person < ActiveRecord::Base
  scope :admin, where(:admin => true)
  has_many :comments
end
