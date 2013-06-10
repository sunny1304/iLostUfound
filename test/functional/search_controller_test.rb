require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get lost" do
    get :lost
    assert_response :success
  end

  test "should get found" do
    get :found
    assert_response :success
  end

end
