require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "1. should not save Category without name" do
    category = Category.new
    assert_not category.save, 'Saved Category without name'
  end
end
