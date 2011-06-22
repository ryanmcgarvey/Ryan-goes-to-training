require 'rubygems'
require 'active_resource'

class Event < ActiveResource::Base
  self.site = "http://localhost:3000"
end

puts "Upcoming events:"
events = Event.all
puts events.map(&:name)

puts "\nFirst event:"
event = Event.find(1)
puts event.name
