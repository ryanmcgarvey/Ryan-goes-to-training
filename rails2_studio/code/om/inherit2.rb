class Parent
  def Parent.cm;  puts "Class method in #{self.name}";    end
end
class Child < Parent
  def Child.other
    cm           #=> Class method in Child
    self.cm      #=> Class method in Child
    Parent.cm    #=> Class method in Parent
  end
end

Child.other
