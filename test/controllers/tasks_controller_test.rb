require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url
  end

  test "1. should get tasks index" do
    user = users(:user_one)
    category = categories(:category_one)
    get user_category_tasks_path(user, category)
    assert_response :success
  end

  test "2. should get new task" do
    user = users(:user_one)
    category = categories(:category_one)
    get new_user_category_task_path(user, category)
    assert_response :success
  end

  test "3. should create new task" do
    user = users(:user_one)
    category = categories(:category_one)
    post user_category_tasks_path(user, category), params: { task: { name: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '2021-03-21' } }
    assert_response :redirect
  end

  test "4. should show task" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    get user_category_task_path(user, category, task)
    assert_response :success
  end

  test "5. should edit task" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    get edit_user_category_task_path(user, category, task)
    assert_response :success
  end

  test "6. should update task" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    put user_category_task_path(user, category, task), params: { task: { name: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '2021-03-21' } }
    assert_response :redirect
  end

  test "7. should delete task" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    delete user_category_task_path(user, category, task)
    assert_response :redirect
  end

  test "8. should assign task as complete" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    put complete_task_path(user, category, task)
    assert_response :redirect
  end

  test "9. should assign task as incomplete" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    delete incomplete_task_path(user, category, task)
    assert_response :redirect
  end
end
