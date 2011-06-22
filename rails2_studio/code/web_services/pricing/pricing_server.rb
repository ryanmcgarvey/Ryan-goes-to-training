require 'sinatra/base'
require 'json'

class PricingServer < Sinatra::Base
  PRICE_DATABASE = {}
  get '/' do
    'Hello world!'
  end

  post '/pricing' do
    content_type 'application/json'
    request_list = JSON.parse(request.body.read)
    response_list = request_list.inject([]) do |result, tuple|
      result << {"name" => tuple["name"], "artist" => tuple["artist"], "price" => price_for(tuple["artist"], tuple["name"])}
    end
    response_list.to_json
  end
  
  private
    def price_for(artist, name)
      PRICE_DATABASE[artist] ||= {}
      PRICE_DATABASE[artist][name] ||= rand(100) # yea, it's random
      PRICE_DATABASE[artist][name] += random_fluctuation
    end
    
    def random_fluctuation
      fluctuation_range = (-2..5).to_a
      fluctuation_range.to_a[rand(fluctuation_range.length)]
    end
end

PricingServer.run! :host => 'localhost', :port => 9090

