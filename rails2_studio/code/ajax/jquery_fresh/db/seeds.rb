# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
dave = Person.create(:name => "Dave")
dave.comments.create(:body => "Dave is a swell guy")
dave.comments.create(:body => "He's a real Texan!")

