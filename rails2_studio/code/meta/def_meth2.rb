class Droid
  define_method(:walk) do |param|
    puts "Called walk with #{param}"
  end
   
  def self.create_method(name, param)
    define_method(name) do
      puts "Called #{name} with #{param}"
    end
  end
  
  create_method(:talk, "I'm so confused!")
  create_method(:sleep, "Oh my goodness. Shut me down!")
end

droid = Droid.new
droid.walk(:west)
droid.talk
droid.sleep

