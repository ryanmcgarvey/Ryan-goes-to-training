require 'rubygems'
require 'active_resource'

class Event < ActiveResource::Base
  self.site = "http://localhost:3000"
  self.user = "test@pragmaticstudio.com"
  self.password = "test"
end

puts "Upcoming events:"
events = Event.all
puts events.map(&:name)

puts "\nFirst event:"
event = Event.find(1)
puts event.name

puts "\nSearching for Ruby:"
p Event.get(:search, :term => "Ruby")

puts "\nCreating a new Event:"
event = Event.new(:name     => "Test Event #{Time.now}", 
                  :location => "Denver, CO",
                  :capacity => 24)
event.save
