#START:impl
class MyOStruct
#END:impl
  def initialize(hash = nil)
    @hash = {}
    hash.each {|k, v| @hash[k.to_sym] = v}
  end
  
#START:impl
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
end
#END:impl

os = MyOStruct.new(:name => "Dave")

os.name    # => "Dave"
os.address = "TX"
os.address # => "TX"

os.inspect # => "#<MyOStruct:0x2308c @hash={:address=>\"TX\", :name=>\"Dave\"}>"
