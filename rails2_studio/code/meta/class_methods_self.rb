class Parent
  def self.hello
    puts "hi from #{self}"
  end
  hello    # >> hi from Parent
end
class Child < Parent
  hello    # >> hi from Child
end


