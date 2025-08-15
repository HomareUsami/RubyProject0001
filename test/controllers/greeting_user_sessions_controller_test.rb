require "test_helper"

class GreetingUserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get greeting_user_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get greeting_user_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get greeting_user_sessions_destroy_url
    assert_response :success
  end
end
