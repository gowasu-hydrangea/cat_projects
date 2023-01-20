require "test_helper"

class Customers::LostCatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customers_lost_cats_new_url
    assert_response :success
  end

  test "should get create" do
    get customers_lost_cats_create_url
    assert_response :success
  end

  test "should get index" do
    get customers_lost_cats_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_lost_cats_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_lost_cats_edit_url
    assert_response :success
  end

  test "should get update" do
    get customers_lost_cats_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_lost_cats_destroy_url
    assert_response :success
  end
end
