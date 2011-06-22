#START:simple
class Module
  def const_missing(name)
    file_name = name.to_s.downcase
    require_relative(file_name) 
    unless const_defined?(name)
      raise "Class not found: #{name}"
    end 
    const_get(name)
  end
end
 
Foo.new
Bar.new
#END:simple

#START:alternative
class Module
  def const_missing(name)
    @looked_for ||= {}
    str_name = name.to_s
    raise "Class not found: #{name}" if @looked_for[str_name]
    @looked_for[str_name] = 1
    file = str_name.gsub(/(\w)([A-Z])/) { "$1_#{$2.downcase}" }.downcase
    require file
    klass = const_get(name)
    return klass if klass
    raise "Class not found: #{name}"
  end
end

Wibble.new
#END:alternative