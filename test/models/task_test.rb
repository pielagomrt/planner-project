require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "1. should not save Task without name" do
    task = Task.new
    task.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    task.date = '20-Feb-2021'
    assert_not task.save, 'Saved Task without name'
  end

  test "2. should not save Task without description" do
    task = Task.new
    task.name = "Lorem"
    task.date = '20-Feb-2021'
    assert_not task.save, 'Saved Task without description'
  end
  test "3. should not save Task without date" do
    task = Task.new
    task.name = 'Lorem'
    task.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    assert_not task.save, 'Saved Task without date'
  end
end
