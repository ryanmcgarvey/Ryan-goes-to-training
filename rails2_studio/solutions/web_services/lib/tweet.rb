class Tweet
  attr_accessor :place, :from_user_id_str, :profile_image_url, :created_at, :from_user, :id_str, :metadata, :to_user_id, :text, :id, :from_user_id, :to_user, :geo, :iso_language_code, :to_user_id_str, :source
  def initialize(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end
  include HTTParty
  BASE_URI = "http://search.twitter.com/search.json?q="
  def self.search(term)
    get(BASE_URI + term)["results"].map do |result|
      new(result)
    end
  end
end
