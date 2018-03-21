require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.new(name:"sports")
  end

  test "name should not be empty" do
    @category.name = "  "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name is too short" do
    @category.name = "a"
    assert !@category.valid?
  end

  test "name is too long" do
    @category.name = "a" * 100
    assert_not @category.valid?
  end

end
