require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url
  end
  
  test "should go to new category form and create category" do
    # go to new category path
    @user = users(:user_one)
    get new_user_category_path(@user)
    assert_response :success

    # submit form
    assert_difference 'Category.count', 1 do
      post user_categories_path(@user), params: { category: { name: 'Lorem Ipsum' } }
      assert_response :redirect
    end
            
    # after submit
    follow_redirect!
    assert_response :success
  end
end