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


end
