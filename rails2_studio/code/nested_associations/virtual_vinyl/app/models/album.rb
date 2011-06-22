class Album < ActiveRecord::Base
    
  VALID_CONDITIONS = %w{ Mint Good Average Poor }

  belongs_to :artist
  validates_presence_of :title, :year, :condition
  validates_numericality_of :year, :greater_than => 1877
  validates_inclusion_of :condition, :in => VALID_CONDITIONS
  
end
