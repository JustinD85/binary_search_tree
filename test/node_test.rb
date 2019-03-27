require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < MiniTest::Test
  attr_reader :node

  def setup
    @node = Node.new
  end

  def test_it_should_exist
    assert_instance_of Node, node
  end

  def test_it_should_have_default_values
    refute node.has_left_node?
    refute node.has_right_node?
    refute node.root?
    refute node.weight
    refute node.name
  end

  def test_it_should_be_able_to_add_weight_name
    node.insert(2, "bob")
    assert_equal 2, node.weight
    assert_equal "bob", node.name
  end

  def test_it_should_be_able_to_add_node
    node.add_node(Node.new)
  end
end
