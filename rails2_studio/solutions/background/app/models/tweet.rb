class Tweet < ActiveRecord::Base
  include HTTParty
  
  BASE_URI = "http://search.twitter.com/search.json?q="
  
  def self.search(term)
    get(BASE_URI + term)["results"].map do |result|
      create(result)
    end
  end
  
  def text=(text)
    self.body = text
  end
end
