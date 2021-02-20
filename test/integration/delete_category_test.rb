require 'test_helper'

class DeleteCategoryTest < ActionDispatch::IntegrationTest
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url
  end

  test 'should delete a category' do
    # get id
    user = users(:user_one)
    category = categories(:category_one)

    # delete button
    assert_difference 'Category.count', -1 do
      delete user_category_path(user, category)
      assert_response :redirect
    end
            
    # after delete
    follow_redirect!
    assert_response :success
  end
end