class Parent
  def self.cm;  puts "Class method in #{self.name}";    end
end
class Child < Parent
end

Parent.cm
Child.cm
