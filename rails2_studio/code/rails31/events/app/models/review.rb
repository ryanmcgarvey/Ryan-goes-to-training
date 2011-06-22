class Review < ActiveRecord::Base
  validates_presence_of :comments, :reviewer
   
  belongs_to :event
end
