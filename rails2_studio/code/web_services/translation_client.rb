require 'httparty'
require 'json'

class TranslationService
  include HTTParty
  def self.request(id, target_language, body)
    base_uri 'http://chadfowler.com:9090'
    JSON.parse(post("/translation", :body => [{'id' => id, 'target_language' => target_language, 'body' => body}].to_json).body)
  end
end

p TranslationService.request(1, "pig-latin", "Now is the time for all good people to do something that is a cliche")
p TranslationService.request(2, "pig-latin", "This is a test message to translate")
