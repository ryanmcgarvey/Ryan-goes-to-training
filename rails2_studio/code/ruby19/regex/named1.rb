re = /(?<key>\w+)=(?<value>.*)/

match = re.match("ruby=cool and fun")

puts match[:key]     #=> ruby
puts match[:value]   #=> cool and fun
