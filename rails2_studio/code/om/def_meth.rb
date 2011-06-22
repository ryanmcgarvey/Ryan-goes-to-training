class MyClass
end

MyClass.instance_eval { define_method(:inst_eval2)  { 1 } }
MyClass.class_eval    { define_method(:class_eval2) { 2 } }

MyClass.inst_eval2       # undefined method `inst_eval1' 
MyClass.class_eval2      # undefined method `class_eval1'
MyClass.new.inst_eval2   # => 1
MyClass.new.class_eval2  # => 2

