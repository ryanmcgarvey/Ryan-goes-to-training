require_relative '../test_helper'

class RegistrationTest < ActiveSupport::TestCase

  test "advanced fixtures" do
    r = registrations(:fred_for_rails)
    
    assert_equal users(:fred), r.user
    assert_equal events(:rails_studio), r.event
  end

end
