require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url
  end

  test "1. should get index" do
    user = users(:user_one)
    get user_categories_path(user)
    assert_response :success
  end

  test "2. should get new" do
    user = users(:user_one)
    get new_user_category_path(user)
    assert_response :success
  end

  test "3. should create" do
    user = users(:user_one)
    post user_categories_path(user), params: { category: { name: 'Lorem Ipsum' } }
    assert_response :redirect
  end

  test "4. should get show" do
    user = users(:user_one)
    category = categories(:category_one)
    get user_category_path(user, category)
    assert_response :success
  end

  test "5. should get edit" do
    user = users(:user_one)
    category = categories(:category_one)
    get edit_user_category_path(user, category)
    assert_response :success
  end

  test "6. should update" do
    user = users(:user_one)
    category = categories(:category_one)
    put user_category_path(user, category), params: { category: { name: 'Lorem' } }
    assert_response :redirect
  end

  test "7. should delete" do
    user = users(:user_one)
    category = categories(:category_one)
    delete user_category_path(user, category)
    assert_response :redirect
  end
end
