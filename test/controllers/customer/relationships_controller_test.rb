require "test_helper"

class Customer::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get customer_relationships_followings_url
    assert_response :success
  end

  test "should get followers" do
    get customer_relationships_followers_url
    assert_response :success
  end
end
