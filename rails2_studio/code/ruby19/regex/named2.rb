if /(?<key>\w+)=(?<value>.*)/ =~ "ruby=cool and fun"
	puts key     #=> ruby
	puts value   #=> cool and fun
end