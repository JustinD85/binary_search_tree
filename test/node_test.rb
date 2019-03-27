require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < MiniTest::Test
  attr_reader :node, :node_2

  def setup
    #basic functionality testing
    @node = Node.new(5, "bob")

    #for feature testing
    @node_2 = Node.new(5, "bob")
    @node_2.add_node(61, "Bill & Ted's Excellent Adventure", {value:0})
    @node_2.add_node(16, "Johnny English", {value:0})
    @node_2.add_node(92, "Sharknado 3", {value:0})
    @node_2.add_node(50, "Hannibal Buress: Animal Furnace", {value:0})
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

  def test_it_should_return_if_has_weight_or_not
    conclusion =  {weight_found: false}
    node_2.has_weight?(5, conclusion)

    assert conclusion[:weight_found]
  end

  def test_it_should_return_false_if_weight_not_found
    conclusion = {weight_found: false}
    node_2.has_weight?(555, conclusion)

    refute conclusion[:weight_found]
  end
end
