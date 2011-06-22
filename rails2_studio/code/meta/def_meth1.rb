class Calculator
  define_method(:double) do |number|
    number * 2
  end
end

puts Calculator.new.double(10)  # => 20
puts Calculator.new.double(20)  # => 40

