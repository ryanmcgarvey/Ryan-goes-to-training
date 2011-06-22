class Player  
  def initialize(name, health=100)
    @name = name
    @health = health
  end
  
  def w00t
    puts "In w00t, @name = #{@name}, @health = #{@health}"
  end
end

player = Player.new("Curly", 99)

player.instance_eval { p self }
player.instance_eval { puts @name; puts @health }
player.instance_eval { w00t }

player.instance_eval { @health = "NO!!!" }
player.instance_eval { w00t }
