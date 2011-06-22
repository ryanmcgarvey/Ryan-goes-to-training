class Parent
  def self.cm1;  puts "Class method in Parent";    end
  def im1;       puts "Instance method in Parent"; end
end
class Child < Parent
  def self.cm2;  puts "Class method in Child";    end
  def im2;       puts "Instance method in Child"; end
end

Child.cm1
Child.cm2
Child.new.im1
Child.new.im2
