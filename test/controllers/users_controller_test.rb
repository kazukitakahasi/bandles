require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_top_url
    assert_response :success
  end

  test "should get mypage" do
    get users_mypage_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get search" do
    get users_search_url
    assert_response :success
  end

  test "should get search_result" do
    get users_search_result_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get edit_profile" do
    get users_edit_profile_url
    assert_response :success
  end

  test "should get edit_profile_image" do
    get users_edit_profile_image_url
    assert_response :success
  end

  test "should get edit_email" do
    get users_edit_email_url
    assert_response :success
  end

  test "should get edit_password" do
    get users_edit_password_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

end
