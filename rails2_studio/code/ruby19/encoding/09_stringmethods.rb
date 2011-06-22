# encoding: utf-8

str = "δog"

puts str.size           # => 3
puts str.bytesize       # => 4
puts str[0]             # => "δ" 
puts str[1]             # => "o"
puts str.reverse        # => "goδ"

# but

puts str.upcase         # => "δOG"
