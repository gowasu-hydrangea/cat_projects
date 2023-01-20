require "test_helper"

class Admins::LostCatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_lost_cats_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_lost_cats_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_lost_cats_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_lost_cats_update_url
    assert_response :success
  end
end
