class Outer
  class Middle
    class Inner
    end
  end
end

#START:impl
def name_to_class(name)
  name.split(/::/).inject(Module) { |klass, next_name| klass.const_get(next_name) }
end
#END:impl

p name_to_class("String")
p name_to_class("Outer::Middle")
p name_to_class("Outer::Middle::Inner")
