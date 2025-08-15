require "test_helper"

class GreetingUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get greeting_users_new_url
    assert_response :success
  end

  test "should get create" do
    get greeting_users_create_url
    assert_response :success
  end

  test "should get edit" do
    get greeting_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get greeting_users_update_url
    assert_response :success
  end
end
