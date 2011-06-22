#START:tease
# a possible solution...
#END:tease

class AttrLogger
  def self.attr_logger(*names)
    names.each do |name|
      iv_name = "@#{name}"
      define_method(name) do
        value = instance_variable_get(iv_name)
        STDERR.puts "Accessing #{iv_name} => #{value.inspect}"
        value
      end
    end
  end
end

class MyClass < AttrLogger
  attr_logger :fred
  attr_writer :fred
end

obj = MyClass.new
obj.fred = 99
a = obj.fred
obj.fred = "cat"
b = obj.fred     