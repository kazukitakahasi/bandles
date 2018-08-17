require 'test_helper'

class FavoriteAlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_albums_create_url
    assert_response :success
  end

  test "should get update" do
    get favorite_albums_update_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_albums_destroy_url
    assert_response :success
  end

end
