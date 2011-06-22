#START:syntax
puts ['daffy', 'donald', 'dopey', 'dizzy'].map(&:upcase)
#END:syntax

#START:to_proc
class Symbol
  def to_proc
    Proc.new { |receiver| receiver.send(self) }
    # could also have used...
    ->receiver{ receiver.send(self) }
  end
end
#END:to_proc
