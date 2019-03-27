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
    refute node.left_node
    refute node.right_node
    refute node.root
  end

end
