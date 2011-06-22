module Greeter
  def greet
    puts "Howdy from #{self.inspect}"
  end
end

[String, Array, Hash].each do |klass|
  klass.class_eval { include Greeter }
end

"mike".greet
[1,2,3].greet
{:a => 1}.greet