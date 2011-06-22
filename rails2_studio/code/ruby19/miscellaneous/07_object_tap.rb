# "tap into" a method chain
(1..10)             .tap {|x| puts "original: #{x.inspect}"}
.to_a               .tap {|x| puts "array: #{x.inspect}"}
.select {|x| x%2==0}.tap {|x| puts "evens: #{x.inspect}"}
.map { |x| x*x }    .tap {|x| puts "squares: #{x.inspect}"}

# original: 1..10
# array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# evens: [2, 4, 6, 8, 10]
# squares: [4, 16, 36, 64, 100]

