require 'httparty'
require 'json'

class PricingService
  include HTTParty
  def self.request(name, artist)
    base_uri 'http://chadfowler.com:9090'
    JSON.parse(post("/pricing", :body => [{'name' => name, 'artist' => artist}].to_json).body)
  end
end

p PricingService.request("Sam & Dave", "Hold On")
p PricingService.request("Ornette Coleman", "The Shape of Jazz to Come")
