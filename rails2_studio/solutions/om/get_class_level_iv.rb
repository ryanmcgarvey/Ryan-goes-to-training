class Game
  @bottles = 99
end

def Game.get_bottles
  @bottles
end

require 'test/unit'
class TestMyClass < Test::Unit::TestCase
  def test_accessor
    assert_equal 99, Game.get_bottles
  end
end

# or... 

class Game
  @bottles = 99 
  
  def self.get_bottles
    @bottles
  end
end