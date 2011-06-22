#START:base
module Timestampable
  def created_at
    @_created_at
  end
  
  def initialize(*)
    @_created_at = Time.now
    super
  end
end      
#END:base

#START:use
class SomeClass < Array

  include Timestampable

end

s = SomeClass.new([1,2,3])
p s.created_at          
p s
sleep 1
s = SomeClass.new
p s.created_at
p s
#END:use