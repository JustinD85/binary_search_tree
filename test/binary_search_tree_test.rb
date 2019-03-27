require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < MiniTest::Test
  attr_reader :tree

  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_should_exist
    assert_instance_of BinarySearchTree, tree
  end

  def test_it_should_have_default_value_of_empty_hash
    refute tree.node
  end

  def test_it_should_return_correct_depth_of_tree
    assert_equal 0, tree.insert(5, "Joe")
    assert_equal 1, tree.insert(4, "Bill")
    assert_equal 2, tree.insert(3, "Bob")
    assert_equal 1, tree.insert(6, "Jill")
    assert_equal 2, tree.insert(7, "Duck")
    assert_equal 3, tree.insert(8, "Fluffikins")
  end

end
