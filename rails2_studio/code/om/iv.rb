class MyClass
  @iv = 123
  
  puts "In class definition, @iv = #{@iv}"

  def self.class_method
    puts "In class method, @iv = #{@iv}"
  end
  def instance_method
   puts "In instance method, @iv = #{@iv}"
 end 
end

MyClass.class_method
MyClass.instance_eval { puts "In instance eval, @iv = #{@iv}" }
MyClass.module_eval   { puts "In instance eval, @iv = #{@iv}" }

MyClass.new.instance_method    #=> nil
