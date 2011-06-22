#START:basic
class Module
  def const_missing(name)
    puts "Missing constant #{name}"
  end
end

Human  # => Missing constant Human
Droid  # => Missing constant Droid
#END:basic

#START:nested
class Module
  def const_missing(name)
    puts "#{self} is missing #{name}"
    self.const_set(name, Class.new)
  end
end

Wibbly::Wobbly::Way::Yipee
#END:nested

#START:localized
class Galaxy  
  def self.const_missing(name)
    puts "Missing #{name} in Galaxy"
  end
end

Galaxy::Pluto     # => "Missing Pluto in Galaxy"
Galaxy::BlackHole # => "Missing BlackHole in Galaxy"
Atom              # => Uninitialized constant Object::Atom
#END:localized