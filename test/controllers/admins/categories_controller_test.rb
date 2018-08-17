require 'test_helper'

class Admins::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_categories_edit_url
    assert_response :success
  end

end
