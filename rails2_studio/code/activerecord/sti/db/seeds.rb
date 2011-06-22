# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

customer1 = Customer.create!(:name => "John Doe", :status => "Gold")
manager1  = Manager.create!(:name => "Mr. Slater", :department => 6)
employee1 = Employee.create!(:name => "Fred Flintstone", :manager => manager1, :department => 6)
employee2 = Employee.create!(:name => "Barney Rubble", :manager => manager1, :department => 6)
customer2 = Customer.create!(:name => "Jane Smith", :status => "Silver")
