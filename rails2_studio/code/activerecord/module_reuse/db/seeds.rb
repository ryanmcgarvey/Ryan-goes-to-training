# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Person.create!(:name => "Fred", :street => "123 Main", :city => "Denver", :state => "CO", :zip => "80111", :country => "US")
Company.create!(:name => "Acme", :street => "123 Main", :city => "Helena", :state => "MT", :zip => "59601", :country => "US")
