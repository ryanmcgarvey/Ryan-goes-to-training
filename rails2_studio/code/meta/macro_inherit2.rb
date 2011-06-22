#START:base
class TimestampedObject
  def self.timestamp_me
    attr_reader :created_at
  end
  
  def initialize(*)
    if defined? created_at
      @created_at = Time.now
    end
  end
end      
#END:base

#START:use
class SomeClass < TimestampedObject
  
  timestamp_me
  
end

s = SomeClass.new
p s.created_at
sleep 1
s = SomeClass.new
p s.created_at
#END:use