class Person  
  def self.find(attribute, value)
    puts "SELECT * FROM people WHERE #{attribute}=#{value}"
  end
  
  def self.method_missing(method_name, *args, &block) 
    string_name = method_name.to_s
    return super unless string_name =~ /^find_by_(\w+)/
    last_word = string_name.split('_').last
    args.unshift($1)
    send(:find, *args)
  end
end

person = Person.new
Person.find_by_name("Joe")  # => "SELECT * FROM people WHERE name=Joe"
Person.find_by_age(21)      # => "SELECT * FROM people WHERE age=21"