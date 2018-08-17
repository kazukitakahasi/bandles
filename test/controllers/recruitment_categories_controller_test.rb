require 'test_helper'

class RecruitmentCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get recruitment_categories_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recruitment_categories_destroy_url
    assert_response :success
  end

end
