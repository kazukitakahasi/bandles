require 'test_helper'

class GoodEvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get good_evaluations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get good_evaluations_destroy_url
    assert_response :success
  end

end
