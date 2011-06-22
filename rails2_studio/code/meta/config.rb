module Configurable
  
  # this is the instance method
  def config
    self.class.config
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
  
  module ClassMethods
    
    def config 
      @_config_hash ||= {}
    end
  end
  
end

class Dave
  include Configurable
  
  config[:logging] = :debug

  def self.class_method
    puts "in class method" if config[:logging] == :debug
  end 
  
  
  def instance_method
    puts "in instance method" if config[:logging] == :debug
  end
  
  def toggle_debug
    if config[:logging] == :debug
      config[:logging] = nil
    else
      config[:logging] = :debug
    end
  end    
end


d = Dave.new
puts "initially"
Dave.class_method
d.instance_method
                
puts "after toggle"
d.toggle_debug
Dave.class_method
d.instance_method
