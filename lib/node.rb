
class Node
  attr_reader :weight, :name

  def initialize(weight, name)
    @left_node = nil
    @right_node = nil
    @weight = weight
    @name = name
  end

  def add_node(weight, name)
    if weight < @weight
      add_left_node(weight, name)
    else
      add_right_node(weight, name)
    end
  end

  def has_left_node?
    @left_node
  end

  def has_right_node?
    @right_node
  end

  def add_left_node(weight, name)
    if has_left_node?
      @left_node.add_node(weight, name)
    else
      @left_node = Node.new(weight, name)
    end
  end

  def add_right_node(weight, name)
    if has_right_node?
      @right_node.add_node(weight, name)
    else
      @right_node = Node.new(weight, name)
    end
  end

end
