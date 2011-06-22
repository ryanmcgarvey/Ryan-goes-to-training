# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  #config.cache_store = :memory_store
  #config.cache_store = :file_store, File.join(Rails.root, "tmp", "caching")
  #config.cache_store = :mem_cache_store # use defaults
  #config.cache_store = :mem_cache_store, { :namespace => 'my_application' }
  config.cache_store = :mem_cache_store, '127.0.0.1:11001', '127.0.0.1:11002'
end
