require 'test_helper'

class Admins::ChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_charges_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_charges_edit_url
    assert_response :success
  end

end
