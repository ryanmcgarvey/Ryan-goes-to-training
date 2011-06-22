#START:impl
module ChumBucket
  def instance_method
    # ..
  end
  module ClassMethods
    def owner
      "Plankton"
    end
  end
  def self.included(other)
    other.extend(ClassMethods)
  end
end
#END:impl

class Restaurant
  include ChumBucket
end

puts Restaurant.owner    