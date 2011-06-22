letters = ('a'..'d').to_enum
numbers = [1,2,3].to_enum

p letters.zip(numbers)  # => [["a", 1], ["b", 2], ["c", 3], ["d", nil]]
