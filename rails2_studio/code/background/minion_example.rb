#!/usr/bin/env ruby
require 'rubygems'


#START:processors
require 'minion'
include Minion

job "upcase" do |args|
  {"greeting" => args["greeting"].upcase}
end

job "reverse" do  |args|
  {"greeting" => args["greeting"].reverse}
end

job "shift" do |args|
  letters = args["greeting"].split(//)
  letters << letters.shift
  {"greeting" => letters.join}
end

job "finish" do |args|
  puts "Finished with: #{args['greeting']}"
end
#END:processors

#START:requestor
enqueue(["upcase", "reverse", "shift", "finish"], {"greeting" => "Hello World"})
#END:requestor