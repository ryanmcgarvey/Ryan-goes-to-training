def create_multipler(factor)
  eval %{
    def times_#{factor}(value)
      value * #{factor}
    end
  }
end

create_multipler(2)
puts times_2(3)   #=> 6
puts times_2(4)   #=> 8
 
create_multipler(3)
puts times_3("Ho! ")  #=> Ho! Ho! Ho!

p Object.private_instance_methods.grep /times/
