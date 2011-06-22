#START:impl
class MyClass
  define_method(:fred) do |param|
    puts "fred(#{param})"
  end
  
  def self.my_create_method(name, param)
    define_method(name) do
      puts name.to_s + ": " + param
    end
  end
end
#END:impl

#START:body
MyClass.my_create_method(:betty, "charge")
MyClass.my_create_method(:wilma, "it!")

obj = MyClass.new
obj.fred("Yabba Dabba")      # >> fred(Yabba Dabba)
obj.betty                    # >> betty: charge
obj.wilma                    # >> wilma: it!
#END:body