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

p Event.get(:search, :term => "Ruby")
