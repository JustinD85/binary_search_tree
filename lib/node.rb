
class Node
  attr_reader :weight, :name

  def initialize(weight, name)
    @left_node = nil
    @right_node = nil
    @weight = weight
    @name = name
  end

  def add_node(weight, name, depth)
    if weight < @weight
      depth[:value] += 1
      add_left_node(weight, name, depth)
    else
      depth[:value] += 1
      add_right_node(weight, name, depth)
    end
  end

  def has_left_node?
    @left_node
  end

  def has_right_node?
    @right_node
  end

  def add_left_node(weight, name, depth)
    if has_left_node?
      @left_node.add_node(weight, name, depth)
    else
      @left_node = Node.new(weight, name)
    end
  end

  def add_right_node(weight, name, depth)
    if has_right_node?
      @right_node.add_node(weight, name, depth)
    else
      @right_node = Node.new(weight, name)
    end
  end

  def has_weight?(weight, conclusion)
    if @weight == weight
      conclusion[:weight_found] = true
    elsif @right_node && weight > @weight
      @right_node.has_weight?(weight, conclusion)
    elsif @left_node && weight < @weight
      @left_node.has_weight?(weight, conclusion)
    end
  end

end
