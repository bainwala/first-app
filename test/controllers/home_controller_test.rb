require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get first" do
    get home_first_url
    assert_response :success
  end

  test "should get second" do
    get home_second_url
    assert_response :success
  end

  test "should get third" do
    get home_third_url
    assert_response :success
  end
end
