def create_multipler(factor)
  lambda { |value| value * factor }
end

times_2 = create_multipler(2)
puts times_2.call(3)   #=> 6
puts times_2.call(4)   #=> 8
 
times_3 = create_multipler(3)
puts times_3.call("Ho! ")  #=> Ho! Ho! Ho!
