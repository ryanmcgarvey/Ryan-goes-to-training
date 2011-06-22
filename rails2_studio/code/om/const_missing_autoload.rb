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