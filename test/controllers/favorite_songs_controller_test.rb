require 'test_helper'

class FavoriteSongsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_songs_create_url
    assert_response :success
  end

  test "should get update" do
    get favorite_songs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_songs_destroy_url
    assert_response :success
  end

end
