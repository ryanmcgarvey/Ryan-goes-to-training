class JobWrapper
  
  def initialize(msg)
    @msg = msg
  end
    
  def perform
    LongRunner.new(@msg).do_hard_work
  end
end