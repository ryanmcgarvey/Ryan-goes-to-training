class UglySentenceDSL < BasicObject
  def initialize
    @words = []
  end
  
  def dump
    ::STDOUT.puts @words.inspect # Can't find STDOUT without ::
  end
  
  def method_missing(*args)
    @words << args    
  end
end

usdsl = UglySentenceDSL.new
usdsl.instance_eval do
  this will work even though i say inspect
end

usdsl.dump