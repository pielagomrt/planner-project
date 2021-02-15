require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  
  test "should go to new task form and create task" do
    # go to new task path
    fixture = tasks(:one)
    get new_category_task_path(fixture)
    assert_response :success

    # submit form
    assert_difference 'Task.count', 1 do
      post category_tasks_path(fixture), params: { task: { name: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '15-Feb-2021' } }
      assert_response :redirect
    end
            
    # after submit
    follow_redirect!
    assert_response :success
  end
end