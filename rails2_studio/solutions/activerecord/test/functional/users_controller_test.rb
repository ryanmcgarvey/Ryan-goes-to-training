require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "Form for new user is returned" do
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:user)
  end
  
  test "create should create user and redirect" do
    assert_difference('User.count', 1) do
      post :create, :user => {:name => "Wilma Flintstone",
                              :email => 'wilma@flintstones.com', 
                              :password => 'secret', 
                              :password_confirmation => 'secret'
                             }
      assert_response :redirect
      assert_redirected_to events_url
    end
  end
end