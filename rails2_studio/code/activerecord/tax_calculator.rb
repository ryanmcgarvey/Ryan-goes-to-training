require 'active_model'

class TaxCalculator
  include ActiveModel::Validations

  attr_accessor :amount, :to_county, :to_state
  
  validates_presence_of :to_county, :to_state
  validates_numericality_of :amount, :greater_than => 0
end

calc = TaxCalculator.new
puts calc.valid?  # => false
puts calc.errors  # => {:to_county=>["can't be blank"], :to_state=>["can't be blank"]}