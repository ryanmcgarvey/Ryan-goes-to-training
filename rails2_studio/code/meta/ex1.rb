#START:tease
# a possible solution
#END:tease

def all_classes_and_modules
  result = []
  ObjectSpace.each_object(Module) { |m| result << m }
  result.sort_by {|m| m.name}
end

def children_of(klass)
  all_classes_and_modules.select {|m| m.kind_of?(Class) && m.superclass == klass}
end

def all_methods
  res = []
  all_classes_and_modules.each do |m|
    if m.kind_of?(Class)
      methods = m.singleton_methods.map {|method| "#{m.name}::#{method}"}
      res.push(*methods.sort) unless methods.empty?
    end
    methods = m.public_instance_methods(false).map {|method| "#{m.name}##{method}"}
    res.push(*methods.sort) unless methods.empty?
  end
  res
end

p all_methods.size