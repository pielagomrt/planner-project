require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url

    @user = users(:user_one)
    @category = categories(:category_one)
  end

  test "1. should get categories index" do
    get user_categories_path(@user)
    assert_response :success
  end  

  test "2. should get new category" do
    get new_user_category_path(@user)
    assert_response :success
  end

  test "3. should create category" do
    post user_categories_path(@user), params: { category: { name: 'Lorem Ipsum' } }
    assert_response :redirect
  end

  test "4. should show category" do
    get user_category_path(@user, @category)
    assert_response :success
  end

  test "5. should edit category" do
    get edit_user_category_path(@user, @category)
    assert_response :success
  end

  test "6. should update category" do
    put user_category_path(@user, @category), params: { category: { name: 'Lorem' } }
    assert_response :redirect
  end

  test "7. should delete category" do
    delete user_category_path(@user, @category)
    assert_response :redirect
  end
end
