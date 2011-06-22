p [1,2,3].map {|i| i + 1948} # => [1949, 1950, 1951]

#START:enum
e = [1,2,3].each  # => #<Enumerator:0x429ce4>
p e.next  # => 1
p e.next  # => 2
e.rewind
p e.next  # => 1
p e.map {|x| x * 2} # => [2, 4, 6]
#END:enum
