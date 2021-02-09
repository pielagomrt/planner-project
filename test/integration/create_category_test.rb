require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  
  test "should go to new category form and create category" do
    # go to new category path
    get new_category_path
    assert_response :success

    # submit form
    assert_difference 'Category.count', 1 do
      post create_category_path, params: { category: { title: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' } }
      assert_response :redirect
    end
            
    # after submit
    follow_redirect!
    assert_response :success
  end
end