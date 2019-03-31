require './lib/node'
require './lib/util'

class BinarySearchTree
  attr_reader :node

  def initialize
    @node = nil
  end
  
  def insert(weight, name)
    conclusion = Util.values_for_conclusion
    @node.add_node(weight, name, conclusion) if @node
    @node = Node.new(weight, name) if !@node

    conclusion[:depth]
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
    conclusion = Util.values_for_conclusion

    @node.assign_to_lightest_node(conclusion)

    conclusion[:lightest_node]
  end

  def sort
    conclusion = Util.values_for_conclusion

    @node.sort_nodes(conclusion)

    conclusion[:sorted_nodes]
  end

  def load(file_path)
    conclusion = Util.values_for_conclusion
    raw_data = File.read(file_path)
    node_text_by_line = raw_data.split("\n")
    root = node_text_by_line[node_text_by_line.length/2].split(",")
    @node = Node.new(root.first.to_i, root.last)
    node_text_by_line.each do |node_info|
      node = node_info.split(",")
      if !@node.has_weight?(node.first.to_i, conclusion)
        @node.add_node(node.first.to_i, node.last, conclusion)
      end
    end.count
  end

  def health(depth)
    conclusion = Util.values_for_conclusion
    @node.health_of_node(depth, conclusion, 5)
    conclusion[:health]
  end

  def leaves
    conclusion = Util.values_for_conclusion
    @node.leaves(conclusion)
    conclusion[:number_of_leaves]
  end

  def height
    conclusion = Util.values_for_conclusion
    @node.height(conclusion)
    conclusion[:depth]
  end

  def delete(weight)
    @node.delete(weight)
  end

end
