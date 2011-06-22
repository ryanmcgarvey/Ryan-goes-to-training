class JobWrapper
  def initialize(msg)
    @msg = msg
  end
    
  def perform
    LongRunner.new(@msg).do_something
  end
end