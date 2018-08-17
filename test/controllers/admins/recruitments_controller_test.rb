require 'test_helper'

class Admins::RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_recruitments_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_recruitments_show_url
    assert_response :success
  end

end
