class Module
  def const_missing(name)
    puts "#{self} is missing #{name}"
    self.const_set(name, Class.new)
  end
end

Wibbly::Wobbly::Way::Yipee
