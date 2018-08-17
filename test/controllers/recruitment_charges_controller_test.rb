require 'test_helper'

class RecruitmentChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get recruitment_charges_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recruitment_charges_destroy_url
    assert_response :success
  end

end
