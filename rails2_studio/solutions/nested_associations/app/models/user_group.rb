class UserGroup < ActiveRecord::Base
  has_many :members, :through => :memberships, :source => :user
  has_many :memberships
  
  all_blank = lambda { |attrs| attrs.all? { |_, v| v.blank? } }
  
  accepts_nested_attributes_for :members, :allow_destroy => true, :reject_if => all_blank
end
