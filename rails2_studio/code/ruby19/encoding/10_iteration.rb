# encoding: utf-8

str = "yo\nδog"

str.each_byte      { |byte| puts byte }
str.each_char      { |char| puts char }
str.each_line      { |line| puts line }
str.each_codepoint { |codepoint| puts codepoint }
