require 'test_helper'

class UserChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_charges_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_charges_destroy_url
    assert_response :success
  end

end
