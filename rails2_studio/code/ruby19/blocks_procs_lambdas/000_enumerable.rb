#START:with_index
words = File
         .foreach("/usr/share/dict/words")
         .with_index {|line, index| puts "Line #{index}: #{line}"}
#END:with_index

#START:with_object
words = File
         .foreach("/usr/share/dict/words")
         .with_object({}) {|line, hash| hash[line.chomp] = 1}
         
p words.keys.first(3)  # => ["A", "a", "aa"]         
#END:with_object
