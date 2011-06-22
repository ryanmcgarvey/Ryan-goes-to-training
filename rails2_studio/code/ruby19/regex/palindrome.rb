palindrome = /\A(?<palindrome>
                       (?# nothing )
                     |
                       .
                     |
                       (?:
                         (?<somecharacter>.)
                            \g<palindrome>
                         \k<somecharacter+0>
                       )
                )\z/x

p palindrome.match("")         # => success
p palindrome.match("a")        # => success
p palindrome.match("madam")    # => success
p palindrome.match("mister")   # => nil