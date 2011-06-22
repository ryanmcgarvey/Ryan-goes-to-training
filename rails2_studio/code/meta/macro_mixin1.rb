module Calculations
  def create_multiplier(factor)
    define_method("times_#{factor}") do |number|
      number * factor
    end
  end
end

class Calculator
  extend Calculations
  
  create_multiplier 2 
  create_multiplier 4 
end
 
calculator = Calculator.new
puts calculator.times_2(10)
puts calculator.times_4(10)