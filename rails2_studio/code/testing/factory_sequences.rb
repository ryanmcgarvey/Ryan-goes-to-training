Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.next :email
# => "person1@example.com"

Factory.next :email
# => "person2@example.com"
