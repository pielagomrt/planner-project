require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "1. should not save Category without title" do
    category = Category.new
    category.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    assert_not category.save, 'Saved Category without title'
  end

  test "2. should not save Category without description" do
    category = Category.new
    category.title = "Lorem Ipsum"
    assert_not category.save, 'Saved Category without description'
  end
end
