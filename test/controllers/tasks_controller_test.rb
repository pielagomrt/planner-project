require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
 test "1. should get index" do
    fixture = categories(:one)
    get category_tasks_path(fixture)
    assert_response :success
  end

  test "2. should get new" do
    fixture = tasks(:one)
    get new_category_task_path(fixture)
    assert_response :success
  end

  test "3. should get show" do
    category = categories(:one)
    category_id = category.id
    task = tasks(:one)
    get category_task_path(category.id, task.id)
    assert_response :success
  end

  test "4. should get edit" do
    fixture = tasks(:one)
    get edit_category_path(fixture)
    assert_response :success
  end
end
