class Calculator
  def self.create_multiplier(factor)
    define_method("times_#{factor}") do |value|
      value * factor
    end
  end
end

Calculator.create_multiplier(2)
calc = Calculator.new
puts calc.times_2(3)   #=> 6
puts calc.times_2(4)   #=> 8
 
Calculator.create_multiplier(3)
puts calc.times_3("Ho! ")  #=> "Ho! Ho! Ho!"
