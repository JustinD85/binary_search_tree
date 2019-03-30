require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < MiniTest::Test
  attr_reader :tree, :tree_2

  def setup
    @tree = BinarySearchTree.new

    @tree_2 = BinarySearchTree.new
    @tree_2.insert(5, "bob")
    @tree_2.insert(61, "Bill & Ted's Excellent Adventure")
    @tree_2.insert(16, "Johnny English")
    @tree_2.insert(92, "Sharknado 3")
    @tree_2.insert(50, "Hannibal Buress: Animal Furnace")
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

  def test_it_should_be_able_to_query_for_inclusion_of_weight
    assert tree_2.include?(5)
    assert tree_2.include?(16)

    refute tree_2.include?(21)
  end

  def test_it_should_return_depth_of_weight_or_nil
    assert_equal 1, tree_2.depthof(61)
    assert_equal 0, tree_2.depthof(5)
    refute tree_2.depthof(9999)
  end

  def test_it_should_return_the_highest_weight_in_tree
    expected = {"Sharknado 3"=> 92 }
    assert_equal expected, tree_2.max
  end

  def test_it_should_return_the_lowest_weight_in_tree
    expected = {"bob"=>5}
    assert_equal expected, tree_2.min
  end

  def test_it_should_return_an_array_of_nodes_sorted
    expected = [{"bob"=>5}, {"Johnny English"=>16},
                {"Hannibal Buress: Animal Furnace"=>50},
                {"Bill & Ted's Excellent Adventure"=>61},
                {"Sharknado 3"=>92}]

    assert_equal expected, tree_2.sort
  end

  def test_it_should_load_file_and_create_tree
    assert_equal 99, tree.load('./test/nodes.txt')
  end

  def test_it_should_report_health_of_tree_at_given_depth
    actual = [[98, 7, 100]]
    expected = tree_2.health(2)

    assert_equal expected, actual
  end

end
