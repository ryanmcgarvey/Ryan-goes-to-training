class MyClass
end

MyClass.instance_eval { def inst_eval1;  1; end }
MyClass.class_eval    { def class_eval1; 2; end }

MyClass.inst_eval1       # => 1
MyClass.class_eval1      # undefined method `class_eval1'
MyClass.new.inst_eval1   # undefined method `inst_eval1'
MyClass.new.class_eval1  # => 2

