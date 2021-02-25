require 'test_helper'

class CompletedTaskTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url

    @user = users(:user_one)
    @category = categories(:category_one)
    @task = tasks(:task_one)
  end

  test '1. should mark task as completed' do
    # mark completed
    assert_changes '@task.completed?' do
      put completed_task_path(@user, @category, @task)
      @task.reload
      assert_response :redirect
    end

    # after submit
    follow_redirect!
    assert_response :success
  end

  test '2. should mark task as pending' do
    # mark pending
    assert_no_changes '@task.completed?' do
      put pending_task_path(@user, @category, @task)
      assert_response :redirect
    end

    # after submit
    follow_redirect!
    assert_response :success
  end

end