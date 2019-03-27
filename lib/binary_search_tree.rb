require './lib/node'
require './lib/util'

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
    conclusion = Util.values_for_conclusion

    @node.has_weight?(weight, conclusion)

    conclusion[:weight_found]
  end

  def depthof(weight)
    conclusion = Util.values_for_conclusion

    @node.has_weight?(weight, conclusion)

    conclusion[:depth] if conclusion[:weight_found]
  end

  def max
    conclusion = Util.values_for_conclusion

    @node.assign_to_heaviest_node(conclusion)

    conclusion[:heaviest_node]
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
