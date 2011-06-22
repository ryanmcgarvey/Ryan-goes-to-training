class Command
  @commands = []
  class << self
    attr_reader :commands
  end
  def self.inherited(subclass)
    commands << subclass
  end
end 
 
Command.commands            # => []

class Stop < Command; end
Command.commands            # => [Stop]

class Start < Command; end
Command.commands            # => [Stop, Start]
