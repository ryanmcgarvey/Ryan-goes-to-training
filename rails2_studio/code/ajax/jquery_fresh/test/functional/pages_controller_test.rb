require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get template" do
    get :template
    assert_response :success
  end

end
