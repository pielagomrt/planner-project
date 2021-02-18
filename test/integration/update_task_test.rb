require 'test_helper'

class UpdateTaskTest < ActionDispatch::IntegrationTest

  test 'should go to edit task form and update task' do
    # go to edit task path
    category = categories(:category_one)
    task = tasks(:task_one)
    get edit_category_task_path(category, task)
    assert_response :success

    # submit form
    assert_changes 'task.name' do
      put category_task_path(category, task), params: { task: { name: 'Lorem' } }
      task.reload
      assert_response :redirect
    end

    assert_changes 'task.description' do
      put category_task_path(category, task), params: { task: { description: 'Lorem ipsum dolor' } }
      task.reload
      assert_response :redirect
    end

    assert_changes 'task.date' do
      put category_task_path(category, task), params: { task: { date: '2021-03-21' } }
      task.reload
      assert_response :redirect
    end
    
    # after submit
    follow_redirect!
    assert_response :success
  end
end