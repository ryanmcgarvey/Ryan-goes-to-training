#START:impl
class MyOStruct
#END:impl
  def initialize(hash = nil)
    @hash = {}
    hash.each {|k, v| @hash[k.to_sym] = v}
  end
  
  def method_missing(name, arg=nil)
    if name.to_s['=']
      v_name = name.to_s.chop.to_sym
      body = proc {|val| @hash[v_name] = val }
    else
      body = proc { @hash[name] }
    end
    
    self.class.send(:define_method, name, &body)
    send(name, arg)
  end
#START:impl
  def initialize_copy(original_object)
    super                 # both copies have same @hash
    @hash = @hash.dup     # not any more
  end
end
#END:impl

os = MyOStruct.new(:name => "Dave")

os.inspect # => "#<MyOStruct:0x22e0c @hash={:name=>\"Dave\"}>"

os2 = os.dup

os2.name = "Walter"

os2.inspect # => "#<MyOStruct:0x22b78 @hash={:name=>\"Walter\"}>"
os.inspect  # => "#<MyOStruct:0x22e0c @hash={:name=>\"Dave\"}>"
