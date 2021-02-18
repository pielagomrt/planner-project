require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "1. should get index" do
    get categories_path
    assert_response :success
  end

  test "2. should get new" do
    get new_category_path
    assert_response :success
  end

  test "3. should get show" do
    category = categories(:category_one)
    get category_path(category)
    assert_response :success
  end

  test "4. should get edit" do
    category = categories(:category_one)
    get edit_category_path(category)
    assert_response :success
  end
end
