#START:impl
class Class
  def cattr_reader(*syms)
    self.class.send(:attr_reader, *syms)
  end
end
#END:impl

class MyThing
  cattr_reader :thing
end

p MyThing.thing        # >> nil
