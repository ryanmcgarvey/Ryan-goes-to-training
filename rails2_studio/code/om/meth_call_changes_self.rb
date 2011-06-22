#START:class_def
class Player
  def set_name
    puts "set_name, self=#{self}"   # => #<Player:0x27a74>
    @name = "Larry"                 # stored in self
    print_name                      # self is implicit receiver
  end

  def print_name
    puts "print_name, self=#{self}" # => #<Player:0x27a74>
    puts "@name is #{@name}"        # => "Larry"
  end
end

puts self            # => main
player = Player.new
player.set_name
puts self            # => main
#END:class_def

class Dave
  def return_self
    return self
  end
end

d = Dave.new

self            # => main
d.return_self   # => #<Dave:0x27a74>
self            # => main
