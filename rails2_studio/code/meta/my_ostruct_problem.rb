require File.join(File.dirname(__FILE__), "my_ostruct")

os = MyOStruct.new(:name => "Dave")

os.inspect # => "#<MyOStruct:0x226a0 @hash={:name=>\"Dave\"}>"

os2 = os.dup

os2.name = "Walter"

os2.inspect # => "#<MyOStruct:0x22420 @hash={:name=>\"Walter\"}>"
os.inspect  # => "#<MyOStruct:0x226a0 @hash={:name=>\"Walter\"}>"
