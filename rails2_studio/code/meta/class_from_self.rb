class MyClass
  class << self
    def class_method
      puts "Hi!"
    end
  end
end

MyClass.class_method   # >> Hi!
