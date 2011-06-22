class MyClass
end

MyClass.instance_eval { define_method(:instance_evaled_method) { 1 } }
MyClass.class_eval    { define_method(:class_evaled_method) { 2 } }

MyClass.instance_evaled_method   # undefined method `instance_evaled_method' 
MyClass.class_evaled_method      # undefined method `class_evaled_method'

MyClass.new.instance_evaled_method   # => 1
MyClass.new.class_evaled_method      # => 2

