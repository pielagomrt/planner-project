require 'test_helper'

class UpdateTaskTest < ActionDispatch::IntegrationTest

  test 'should go to edit task form and update task' do
    # go to edit task path
    category = categories(:one)
    task = tasks(:one)
    get edit_category_task_path(category.id, task.id)
    assert_response :success


    assert_changes 'task.description' do
        put category_task_path(category.id, task.id), params: { task: { description: 'Lorem ipsum dolor' } }
        assert_response :redirect
    end

  #   # assert_changes 'task.date' do
  #   #     put category_task_path(category.id, task.id), params: { task: { date: '21-Feb-2021' } }
  #   #     category.reload
  #   #     task.reload
  #   #     assert_response :redirect
  #   # end
    

    # after submit
    follow_redirect!
    assert_response :success
  end
end