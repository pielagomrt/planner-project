require 'test_helper'

class DeleteTaskTest < ActionDispatch::IntegrationTest

  test 'should delete a category' do
    # get id
    category = categories(:category_one)
    task = tasks(:task_one)
    
    # delete button
    assert_difference 'Task.count', -1 do
      delete category_task_path(category, task)
      assert_response :redirect
    end
            
    # after delete
    follow_redirect!
    assert_response :success
  end
end