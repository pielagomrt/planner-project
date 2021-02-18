require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
 test "1. should get index" do
    category = categories(:category_one)
    get category_tasks_path(category)
    assert_response :success
  end

  test "2. should get new" do
    category = categories(:category_one)
    get new_category_task_path(category)
    assert_response :success
  end

  test "3. should get show" do
    category = categories(:category_one)
    task = tasks(:task_one)
    get category_task_path(category, task)
    assert_response :success
  end

  test "4. should get edit" do
    category = categories(:category_one)
    task = tasks(:task_one)
    get edit_category_path(category, task)
    assert_response :success
  end
end
