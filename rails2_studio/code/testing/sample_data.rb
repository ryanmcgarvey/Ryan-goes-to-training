require 'faker'
include Faker

2.times do
  puts "#{Name.first_name} #{Name.last_name} lives at 
        #{Address.street_address} in #{Address.city}, 
        #{Address.us_state} and works at #{Company.name}
         where he/she works to #{Company.bs}"
  puts "Phone at #{PhoneNumber.phone_number} or email 
         at #{Internet.email}"
  puts
end
