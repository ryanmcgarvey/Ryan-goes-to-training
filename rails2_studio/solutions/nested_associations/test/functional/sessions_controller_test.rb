require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "new should render login page" do
    get :new
    assert_response :success
    assert_template "sessions/new"
  end
  
  test "create should redirect to events page for valid login" do
    post :create, :email => users(:fred).email, :password => 'test'
    
    assert_response :redirect
    assert_redirected_to events_url
    assert_equal users(:fred).id, session[:user_id]
  end
  
  test "create should show login page for invalid login" do
    post :create, :email => users(:fred).email, :password => 'badpass'
    
    assert_response :success
    assert_template "sessions/new"
    assert_nil session[:user_id]
  end
  
  test "destroy should remove user_id from session" do
    delete :destroy, {}, :user_id => users(:fred).id
    
    assert_redirected_to events_url
    assert_nil session[:user_id]    
  end

end
