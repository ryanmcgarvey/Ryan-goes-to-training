animal = "cat"
class << animal
  def speak
    puts "miaow"
  end
end

animal.speak # >> miaow

p animal.methods.sort # >> [ ... "sort_by", "speak", "split", ...]
