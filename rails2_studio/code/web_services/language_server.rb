require 'sinatra/base'
require 'json'
require 'pig'

class TranslationServer < Sinatra::Base
  get '/' do
p params
    'Hello world!'
  end

  post '/translation' do
    content_type 'application/json'
    request_list = JSON.parse(request.body.read)
p request_list
    response_list = request_list.map do |tuple|
      tuple["translation"] = tuple["body"].split.map{|word| pig(word)}.join(" ")
      tuple
    end
    response_list.to_json
  end
end

TranslationServer.run!  :port => 9090
