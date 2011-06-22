def MyStruct(*keys)
  Class.new do
    attr_accessor *keys
    def initialize(hash)
      hash.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end

Person = MyStruct :name, :address, :age
dave = Person.new(:name => "dave", :address => "TX", :age => 27)
chad = Person.new(:name => "chad", :address => "CO", :age => 26.5)

dave.name     # => "dave"
chad.address  # => "CO"
