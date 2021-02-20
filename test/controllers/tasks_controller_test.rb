require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url
  end

  test "1. should get index" do
    user = users(:user_one)
    category = categories(:category_one)
    get user_category_tasks_path(user, category)
    assert_response :success
  end

  test "2. should get new" do
    user = users(:user_one)
    category = categories(:category_one)
    get new_user_category_task_path(user, category)
    assert_response :success
  end

  test "3. should create" do
    user = users(:user_one)
    category = categories(:category_one)
    post user_category_tasks_path(user, category), params: { task: { name: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '2021-03-21' } }
    assert_response :redirect
  end

  test "4. should get show" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    get user_category_task_path(user, category, task)
    assert_response :success
  end

  test "5. should get edit" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    get edit_user_category_task_path(user, category, task)
    assert_response :success
  end

  test "6. should update" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    put user_category_task_path(user, category, task), params: { task: { name: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '2021-03-21' } }
    assert_response :redirect
  end

  test "7. should delete" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    delete user_category_task_path(user, category, task)
    assert_response :redirect
  end

   test "8. should assign complete" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    put complete_task_path(user, category, task)
    assert_response :redirect
  end

   test "9. should assign incomplete" do
    user = users(:user_one)
    category = categories(:category_one)
    task = tasks(:task_one)
    delete incomplete_task_path(user, category, task)
    assert_response :redirect
  end
end
