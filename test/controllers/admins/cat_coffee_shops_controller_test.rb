require "test_helper"

class Admins::CatCoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_cat_coffee_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_cat_coffee_shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_cat_coffee_shops_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_cat_coffee_shops_update_url
    assert_response :success
  end
end
