require "test_helper"

class Customer::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get customer_searches_search_url
    assert_response :success
  end
end
