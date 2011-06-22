module Vocal
  def speak
    puts "#{self} says hello"
  end
end

animal = "cat"
animal.extend Vocal
animal.speak
