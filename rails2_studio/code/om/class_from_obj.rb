animal = "cat"
singleton = class << animal
  def speak
    puts "Miaow"
  end
  self
end

animal.speak  # => "Miaow"

p singleton.instance_methods(false)  # => [:speak]
