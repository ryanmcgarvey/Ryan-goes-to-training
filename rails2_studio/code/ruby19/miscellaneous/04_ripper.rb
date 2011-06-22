require 'ripper/filter'

class MethodCounter < Ripper::Filter
  def MethodCounter.count_from(src)
    counter = new(src)
    counter.parse(nil)
    counter.count
  end
  attr :count
  def initialize(src)
    super
    @count = 0
  end
  
  def on_kw(word, *args)
    @count += 1 if word == "def"
  end
end

puts MethodCounter.count_from(IO.read(__FILE__))
