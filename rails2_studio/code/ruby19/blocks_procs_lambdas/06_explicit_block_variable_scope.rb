number_processed = 0
pizza_shop = ->(*orders; number_processed) do
  number_processed = 0
  orders.each do
    number_processed += 1
  end
  puts "#{number_processed} orders processed"
end

pizza_shop["pepperoni", "anchovies"]
puts "Outside the ->(), number_processed is #{number_processed}"

# 2 orders processed
# Outside the ->(), number_processed is 0
