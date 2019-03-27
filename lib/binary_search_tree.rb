require './lib/node'

class BinarySearchTree
  attr_reader :node

  def initialize
    @node = nil
  end

  def insert(weight, name)
    depth = {value: 0}

    @node.add_node(weight, name, depth) if @node
    @node = Node.new(weight, name) if !@node

    depth[:value]
  end

  def include?(weight)
    conclusion = {weight_found: false, depth: 0}

    @node.has_weight?(weight, conclusion)

    conclusion[:weight_found]
  end

  def depthof(weight)
    conclusion = {weight_found: false, depth: 0}

    @node.has_weight?(weight, conclusion)

    conclusion[:depth] if conclusion[:weight_found]
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
