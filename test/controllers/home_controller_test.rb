require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  
  test "should get first" do
    get home_first_url
    assert_response :success
    assert_select "h1", "Poker"
  end

  test "should get second" do
    get home_second_url
    assert_response :success
    assert_select "h1", "Poker"
    assert_select "h1", "Rules!"
  end

  test "should get third" do
    get home_third_url
    assert_response :success
    assert_select "h1", "Poker"
    assert_select "h1", "Current Users!"
  end
end
