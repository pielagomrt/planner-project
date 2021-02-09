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

  test "3. should get create" do
    post create_category_path, params: { category: { title: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' } }
    assert_response :redirect
  end

  test "4. should get show" do
    fixture = categories(:one)
    get show_category_path(fixture)
    assert_response :success
  end

  test "5. should get edit" do
    fixture = categories(:one)
    get edit_category_path(fixture)
    assert_response :success
  end

  test "6. should put update" do
    fixture = categories(:one)
    put update_category_path(fixture), params: { category: { title: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' } }
    assert_response :redirect
  end

  test "7. should delete delete" do
    fixture = categories(:one)
    delete delete_category_path(fixture)
    assert_response :redirect
  end
end
