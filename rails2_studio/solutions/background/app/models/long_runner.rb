class LongRunner
  def initialize(message)
    @message = message
  end
  
  def do_something
    puts "STARTING #{@message}"
    # work work work...
    sleep 3
    puts "ENDING"
  end
end