require 'test_helper'

class UpdateCategoryTest < ActionDispatch::IntegrationTest

  test 'should go to edit category form and update category' do
    # go to edit category path 
    fixture = categories(:one)
    get edit_category_path(fixture)
    assert_response :success

    # submit form
    assert_changes 'fixture.name' do
        put category_path(fixture), params: { category: { name: 'Lorem' } }
        fixture.reload
        assert_response :redirect
    end

    # after submit
    follow_redirect!
    assert_response :success
  end
end