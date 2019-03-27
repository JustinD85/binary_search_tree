require './lib/node'

class BinarySearchTree
  attr_reader :node

  def initialize
    @node = nil
  end

  def insert(weight, name)
    @node = Node.new(weight, name) unless @node
    @node.add_node(weight, name) if node
  end

  def include?(weight)
  end

  def depthof(weight)
  end

  def max
  end

  def min
  end

  def sort
  end

  def load(file_path)
  end

  def health(depth)
  end

  def leaves
  end

  def height
  end

  def delete(weight)
  end

end
