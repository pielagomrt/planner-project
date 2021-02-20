require 'test_helper'

class UpdateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url
  end

  test 'should go to edit category form and update category' do
    # go to edit category path
    user = users(:user_one) 
    category = categories(:category_one)
    get edit_user_category_path(user, category)
    assert_response :success

    # submit form
    assert_changes 'category.name' do
      put user_category_path(user, category), params: { category: { name: 'Lorem' } }
      category.reload
      assert_response :redirect
    end

    # after submit
    follow_redirect!
    assert_response :success
  end
end