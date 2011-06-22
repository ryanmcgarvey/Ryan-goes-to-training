# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Auth
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/auth/
      request = Rack::Auth::Basic::Request.new
      if auth.provided?
      do |username, password|
        raise [username, password].inspect
      end
    end
  end
end

