################################################################### 
# Part 1: my_attr_reader and my_attr_accessor class methods
################################################################### 

require 'test/unit'

class Player
  def self.my_attr_reader(*fields)
    attr_reader(*fields)
  end
  
  def self.my_attr_accessor(*fields)
    attr_accessor(*fields)
  end

  my_attr_accessor :name   
  my_attr_reader   :health
  
  def initialize(name, health=100)
    @name = name
    @health = health
  end
end

class TestPlayer < Test::Unit::TestCase
  def setup
    @player = Player.new("Larry", 100)
  end
  
  def test_basic_reader
    assert_equal "Larry", @player.name
    assert_equal 100, @player.health
  end
  
  def test_basic_accessor
    @player.name = "Lawrence"
    assert_equal "Lawrence", @player.name
  end
end

################################################################### 
# Part 2: my_attributes returns a list of all attributes
################################################################### 

class Player2

  def self.my_attributes
    @my_attributes ||= []
  end
  
  def self.my_attr_accessor(*fields)
    attr_accessor(*fields)
    my_attributes.concat(fields)
  end
  
  def self.my_attr_reader(*fields)
    attr_reader(*fields)
    my_attributes.concat(fields)
  end
  
  my_attr_accessor :name   
  my_attr_reader   :health
  
  def initialize(name, health=100)
    @name = name
    @health = health
  end
end

class TestPlayer2 < Test::Unit::TestCase
  def setup
    @player = Player2.new("Larry", 100)
  end
  
  def test_basic_reader
    assert_equal "Larry", @player.name
    assert_equal 100, @player.health
  end
  
  def test_basic_accessor
    @player.name = "Lawrence"
    assert_equal "Lawrence", @player.name
  end
  
  def test_attributes_list
    assert_equal [:health, :name], Player2.my_attributes.sort
  end
end 

################################################################### 
# Part 3: Refactor methods into a module
################################################################### 

module MyAccessor
  def my_attributes
    @my_attributes ||= []
  end
  
  def my_attr_accessor(*fields)
    attr_accessor(*fields)
    my_attributes.concat(fields)
  end
  
  def my_attr_reader(*fields)
    attr_reader(*fields)
    my_attributes.concat(fields)
  end
end
  
class Player3
  extend MyAccessor
  my_attr_accessor :name   
  my_attr_reader   :health
  
  def initialize(name, health=100)
    @name = name
    @health = health
  end
end
             
class TestPlayer3 < Test::Unit::TestCase
  def setup
    @player = Player3.new("Larry", 100)
  end
  
  def test_basic_reader
    assert_equal "Larry", @player.name
    assert_equal 100, @player.health
  end
  
  def test_basic_accessor
    @player.name = "Lawrence"
    assert_equal "Lawrence", @player.name
  end
  
  def test_attributes_list
    assert_equal [:health, :name], Player3.my_attributes.sort
  end
end 
  
################################################################### 
# Part 4: Record the name of all attributes in all classes
################################################################### 

module MyAccessor 
  GLOBAL_ACCESSORS = []
  
  def my_attributes
    @my_attributes ||= []
  end
  
  def my_attr_accessor(*fields)
    attr_accessor(*fields)
    my_attributes.concat(fields)
    GLOBAL_ACCESSORS.concat(fields.map {|f| "#{self.name}\##{f}"})
  end
  
  def my_attr_reader(*fields)
    attr_reader(*fields)
    my_attributes.concat(fields)
    GLOBAL_ACCESSORS.concat(fields.map {|f| "#{self.name}\##{f}"})
  end
end
  
class Player4
  extend MyAccessor
  my_attr_accessor :name   
  my_attr_reader   :health
  
  def initialize(name, health=100)
    @name = name
    @health = health
  end
end            

class Game
  extend MyAccessor
  my_attr_reader :title
  
  def initialize(title)
    @title = title
  end
end

class TestGame < Test::Unit::TestCase
  
  def setup
    @game = Game.new("Knuckleheads")
  end
  
  def test_basic_reader
    assert_equal "Knuckleheads", @game.title
  end
  
  def test_attributes_list
    assert_equal [:title], Game.my_attributes.sort
  end
  
  def test_global_attributes_list
    assert_equal [ "Player4#name","Player4#health", "Game#title" ], MyAccessor::GLOBAL_ACCESSORS
  end
end 

