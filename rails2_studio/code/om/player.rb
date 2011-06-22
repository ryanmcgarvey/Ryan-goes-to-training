#START:class_def
class Player
  attr_accessor :name, :health

  def initialize(name, health=100)
    @name = name
    @health = health
  end

  def w00t
    @health += 10
  end

  def blam
    @health -= 10
  end
end
#END:class_def

larry = Player.new("Larry")
larry.blam
p larry

curly = Player.new("Curly", 120)
curly.w00t
p curly