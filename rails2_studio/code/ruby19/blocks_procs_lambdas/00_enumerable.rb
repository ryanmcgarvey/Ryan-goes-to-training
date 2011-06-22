deck = %w{C D H S}
        .product(['A', *2..10, 'J', 'Q', 'K'])
        .map(&:join)
        
hands = deck.shuffle.each_slice(13)

p hands.next
p hands.next
p hands.next
p hands.next

%w{ North East South West }.zip(hands) do |seat, cards|
  puts "#{seat}:\t#{cards.join(', ')}"
end
