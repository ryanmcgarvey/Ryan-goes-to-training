def my_method(param)
  local_var = "wibble"
  binding  # creates a binding object
end

b = my_method(99) { "a block value" }

# run code in the context of the binding using:

puts eval("param", b)

# or ...

puts b.eval("param")
puts b.eval("local_var")
puts b.eval("yield")
