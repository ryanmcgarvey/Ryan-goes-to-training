require 'httparty'
require 'pp'
 
class Rep
  include HTTParty
  def self.find_by_zip(zip_code)
    get('http://whoismyrepresentative.com/whoismyrep.php', 
        query: {zip: zip_code})
  end
end

pp Rep.find_by_zip(ARGV[0] || 80501)
