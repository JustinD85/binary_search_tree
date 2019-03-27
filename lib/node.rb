
class Node
  attr_reader :root, :left_node, :right_node

  def initialize(left_node = nil, right_node = nil)
    @left_node = left_node
    @right_node = right_node
    @root = false
  end

  def root?
    @root
  end


end
