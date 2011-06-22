# encoding: utf-8
popcorn = "Popcorn!"
puts popcorn.encoding.name # => "UTF_8"

str = "Popcorn!".encode("US-ASCII") # => "Popcorn!"
puts str.encoding.name              # => "US_ASCII"

hello = "ओ एम जी" 
str = hello.encode("US-ASCII")      # "\xE0\xA4\x93" from UTF-8 to US-ASCII
                                    # (Encoding::UndefinedConversionError)