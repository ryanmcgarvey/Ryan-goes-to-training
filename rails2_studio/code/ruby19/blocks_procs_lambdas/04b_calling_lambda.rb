less_than_one_thousand = -> x {x < 1000}    
# could also have used lambda {|x| x < 1000}

divisible_by_three     = -> x {x % 3 == 0}

case 1005
when less_than_one_thousand
  puts "Less than a thousand"
when divisible_by_three
  puts "Divisible by three"
end

# => "Divisible by three"