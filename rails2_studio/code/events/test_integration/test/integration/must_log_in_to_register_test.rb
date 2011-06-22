#START:int1
require 'test_helper'

class MustLogInToRegisterTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "we're redirected to log in if we register if we are logged out" do
    event = events(:rails_studio)
    get                   "/events"
    assert_response       :success
    assert_select("h2 a", event.name)
    post                  event_registrations_path(event)
    assert_redirected_to  new_session_path
  end
#END:int1

#START:int2    
  test "we can register if logged in" do
    event = events(:rails_studio)
    fred  = users(:fred)
    
    post_via_redirect session_path, :email => fred.email, :password => 'test'
    assert_equal "/events", path
    post event_registrations_path(event)
    assert_equal event_registrations_path(event), path
    assert flash[:notice], "Looking for a flash message"
  end
#END:int2
#START:int1
end
#END:int1
