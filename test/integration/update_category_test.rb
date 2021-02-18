require 'test_helper'

class UpdateCategoryTest < ActionDispatch::IntegrationTest

  test 'should go to edit category form and update category' do
    # go to edit category path 
    category = categories(:category_one)
    get edit_category_path(category)
    assert_response :success

    # submit form
    assert_changes 'category.name' do
        put category_path(category), params: { category: { name: 'Lorem' } }
        category.reload
        assert_response :redirect
    end

    # after submit
    follow_redirect!
    assert_response :success
  end
end