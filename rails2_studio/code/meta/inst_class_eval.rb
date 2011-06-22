class Droid
end

Droid.class_eval do
  def talk
    puts "Is my head on straight?"
  end
end

Droid.instance_eval do
  def default_color
    :gold
  end
end

Droid.default_color  # => :gold
Droid.new.talk       # => "Is my head on straight?"

Droid.talk                # undefined method `talk'
Droid.new.default_color   # undefined method `default_color'

