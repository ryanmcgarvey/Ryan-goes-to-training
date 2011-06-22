class Person
  class << self
    def greet
      puts "Howdy"
    end
  end
end

Person.greet  # => "Howdy"
