class Parent
  def self.hello
    puts "Hello from #{self}"
  end
  
  hello    # >> "Hello from Parent"
end

class Child < Parent
  hello    # >> "Hello from Child"
end
