#START:impl
class Parent
  def fred
    puts "Yabba Dabba Do!"
  end
end

class Child < Parent
  define_method(:barney, instance_method(:fred))
end
#END:impl

#START:body
c = Child.new
c.fred     # >> Yabba Dabba Do!
c.barney   # >> Yabba Dabba Do!

p = Parent.new
p.fred     # >> Yabba Dabba Do!
p.barney   # undefined method `barney' 
#END:body