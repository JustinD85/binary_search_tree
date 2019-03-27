require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/util'

class NodeTest < MiniTest::Test
  attr_reader :node, :node_2, :conclusion

  def setup
    #basic functionality testing
    @node = Node.new(5, "bob")

    #for feature testing
    @node_2 = Node.new(5, "bob")
    @node_2.add_node(61, "Bill & Ted's Excellent Adventure", {value:0})
    @node_2.add_node(16, "Johnny English", {value:0})
    @node_2.add_node(92, "Sharknado 3", {value:0})
    @node_2.add_node(50, "Hannibal Buress: Animal Furnace", {value:0})
    @conclusion =  Util.values_for_conclusion
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
    node_2.has_weight?(5, conclusion)

    assert conclusion[:weight_found]
  end

  def test_it_should_return_false_if_weight_not_found
    node_2.has_weight?(555, conclusion)

    refute conclusion[:weight_found]
  end

  def test_it_should_assign_itself_to_heaviest_node
    node_2.assign_to_heaviest_node(conclusion)
    expected = {"Sharknado 3"=>92}
    assert_equal expected, conclusion[:heaviest_node]
  end
end
