
class Node
  attr_reader :weight, :name

  def initialize(weight, name)
    @left_node = nil
    @right_node = nil
    @weight = weight
    @name = name
  end

  def add_node(weight, name, conclusion)
    conclusion[:depth] += 1

    if weight < @weight
      add_left_node(weight, name, conclusion)
    else
      add_right_node(weight, name, conclusion)
    end
  end

  def has_left_node?
    @left_node
  end

  def has_right_node?
    @right_node
  end

  def add_left_node(weight, name, conclusion)
    if has_left_node?
      @left_node.add_node(weight, name, conclusion)
    else
      @left_node = Node.new(weight, name)
    end
  end

  def add_right_node(weight, name, conclusion)
    if has_right_node?
      @right_node.add_node(weight, name, conclusion)
    else
      @right_node = Node.new(weight, name)
    end
  end

  def has_weight?(weight, conclusion)
    conclusion[:depth] += 1 unless @weight == weight

    if @weight == weight
      conclusion[:weight_found] = true
    elsif @right_node && weight > @weight
      @right_node.has_weight?(weight, conclusion)
    elsif @left_node && weight < @weight
      @left_node.has_weight?(weight, conclusion)
    end
  end

  def assign_to_heaviest_node(conclusion)
    if @right_node
      @right_node.assign_to_heaviest_node(conclusion)
    else
      conclusion[:heaviest_node] = { name => weight}
    end
  end

  def assign_to_lightest_node(conclusion)
    if @left_node
      @left_node.assign_to_lightest_node(conclusion)
    else
      conclusion[:lightest_node] = { name => weight}
    end
  end

  def sort_nodes(conclusion)
    @left_node.sort_nodes(conclusion) if @left_node
    conclusion[:sorted_nodes] << {@name => @weight}
    @right_node.sort_nodes(conclusion) if @right_node
  end

  def 
  end
end
