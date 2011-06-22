def my_method(p1, p2)
  count = 0
  lambda { count +=1 ; [count, p1, p2] } # closes around scope
end  

proc = my_method("cat", "dog")

p proc.call   # => [1, "cat", "dog"]
p proc.call   # => [2, "cat", "dog"]
p proc.call   # => [3, "cat", "dog"]

p proc.binding.eval("count")  # => 3    