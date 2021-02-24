require 'test_helper'

class UpdateTaskTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url

    @user = users(:user_one)
    @category = categories(:category_one)
    @task = tasks(:task_one)
  end

  test 'should go to edit task form and update task' do
    # go to edit task path
    get edit_user_category_path(@user, @category)
    assert_response :success

    # submit form
    assert_changes '@task.name' do
      put user_category_task_path(@user, @category, @task), params: { task: { name: 'Lorem' } }
      @task.reload
      assert_response :redirect
    end

    assert_changes '@task.description' do
      put user_category_task_path(@user, @category, @task), params: { task: { description: 'Lorem ipsum dolor' } }
      @task.reload
      assert_response :redirect
    end

    assert_changes '@task.date' do
      put user_category_task_path(@user, @category, @task), params: { task: { date: '2021-03-21' } }
      @task.reload
      assert_response :redirect
    end
    
    # after submit
    follow_redirect!
    assert_response :success
  end
end