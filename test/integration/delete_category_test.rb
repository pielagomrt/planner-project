require 'test_helper'

class DeleteCategoryTest < ActionDispatch::IntegrationTest

  test 'should delete a category' do
    # get id
    category = categories(:category_one)

    # delete button
    assert_difference 'Category.count', -1 do
      delete category_path(category)
      assert_response :redirect
    end
            
    # after delete
    follow_redirect!
    assert_response :success
  end
end