puts "Before class definition, self=#{self}"    # => main

class Player
  puts "Inside class definition, self=#{self}"  # => Player
  puts "Class of self = #{self.class}"          # => Class
end

puts "After class definition, self=#{self}"     # => main
