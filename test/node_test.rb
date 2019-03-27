require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < MiniTest::Test
  attr_reader :node

  def setup
    @node = Node.new(5, "bob")
  end

  def test_it_should_exist
    assert_instance_of Node, node
  end

  def test_it_should_have_default_values
    refute node.has_left_node?
    refute node.has_right_node?
    assert_equal 5,  node.weight
    assert_equal "bob", node.name
  end

  def test_it_should_be_able_to_add_node
    node.add_node(4, "Karen", {value: 1})
    assert node.has_left_node?
    refute node.has_right_node?

    node.add_node(6, "Jim", {value: 1})
    assert node.has_right_node?
  end

end
