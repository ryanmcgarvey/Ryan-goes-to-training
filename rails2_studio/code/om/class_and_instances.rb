class Person
  @count = 0
  
  puts "In class definition: self=#{self}, count=#{@count}"
  
  class << self
    puts "In singleton class: self=#{self}"
  end
  
  def instance_method
    puts "In instance method: self=#{self}, @count = #{@count}"  
    # not the same @count that's in the class
  end
  
  def self.class_method
    puts "In class method: self=#{self}"
  end
end

Person.new.instance_method
Person.class_method