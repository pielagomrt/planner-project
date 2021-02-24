require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
    post user_session_url
  end
  
  test "should go to new task form and create task" do
    # go to new task path
    @user = users(:user_one)
    @category = categories(:category_one)
    get new_user_category_task_path(@user, @category)
    assert_response :success

    # submit form
    assert_difference 'Task.count', 1 do
      post user_category_tasks_path(@user, @category), params: { task: { name: 'Lorem Ipsum', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '2021-03-21' } }
      assert_response :redirect
    end
            
  #   # after submit
    follow_redirect!
    assert_response :success
  end
end