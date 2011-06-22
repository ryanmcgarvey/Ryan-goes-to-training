def cook(food, *recipients, options)
  if options[:verbose]
    puts "Cooking #{food} for #{recipients.join(', ')}"  
  end
  # cook the food
end

cook("Bagels", "Bill", "Hector", "Pierre", verbose: true)
# => "Cooking Bagels for Bill, Hector, Pierre"