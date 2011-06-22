class Person
  @count = 0  # ivar of the class object
  
  class << self
    attr_accessor :count
  end
  
  def initialize
    Person.count += 1
  end
end

person1 = Person.new
person2 = Person.new
puts "There are #{Person.count} person objects."