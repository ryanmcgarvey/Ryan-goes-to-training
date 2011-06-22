#START:module
module Persistable
  def save
    puts "Saving..."
  end
  
  module ClassMethods    
    def find
      puts "Finding..."
      new
    end
  end
  
  def self.included(klass)
    klass.extend ClassMethods
  end
end
#END:module
#START:impl
class Person
  include Persistable
end

person = Person.find
person.save
#END:impl

#START:original
module ChumBucket
  def instance_method
    # ..
  end
  module ClassMethods
    def owner
      "Plankton"
    end
  end
  def self.included(other)
    other.extend(ClassMethods)
  end
end

class Restaurant
  include ChumBucket
end

puts Restaurant.owner    
#END:original
