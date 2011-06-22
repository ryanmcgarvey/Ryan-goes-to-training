#START:simplecov
require 'simplecov'
fail "no coverage" unless SimpleCov.start('rails')

# rest of file...
#END:simplecov

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


class ActiveSupport::TestCase

  fixtures :all

  # Add more helper methods to be used by all tests here...
end
