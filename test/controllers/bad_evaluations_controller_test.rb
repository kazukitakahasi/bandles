require 'test_helper'

class BadEvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bad_evaluations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bad_evaluations_destroy_url
    assert_response :success
  end

end
