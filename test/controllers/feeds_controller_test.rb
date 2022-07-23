require 'test_helper'

class FeedsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get feeds_home_url
    assert_response :success
  end

end
