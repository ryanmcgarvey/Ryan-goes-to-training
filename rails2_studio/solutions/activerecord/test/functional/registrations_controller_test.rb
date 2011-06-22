require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  
  setup do 
    @event = events(:rails_studio)
  end
  
  test "create should redirect to login when not logged in" do
    get :create, :event_id => @event.id
    assert_response :redirect
    assert_redirected_to new_session_url
  end
  
  test "create should not redirect to login when logged in" do
    get :create, {:event_id => @event.id}, { :user_id => users(:fred).id }    
    assert_response :success
    assert_template 'create'
  end
  
end
