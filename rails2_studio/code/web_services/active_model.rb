require 'active_model'

class Person
  include ActiveModel::Serializers::Xml
  include ActiveModel::Serializers::JSON
  # or just 
  include ActiveModel::Serialization
  
  attr_accessor :name, :age
  
  def attributes 
    @attributes ||= {'name' => 'nil', 'age' => 'nil'}
  end
end

person = Person.new
puts person.serializable_hash

person.name = "Joe"
person.age = 21

puts person.to_json
puts person.to_xml