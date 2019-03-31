
class Node
  attr_reader :weight, :name,:depth, :left_node, :right_node

  def initialize(weight, name, depth=0)
    @left_node = nil
    @right_node = nil
    @weight = weight
    @name = name
    @depth = depth
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
      @left_node = Node.new(weight, name, @depth + 1)
     return @left_node.depth
    end
  end

  def add_right_node(weight, name)
    if has_right_node?
      @right_node.add_node(weight, name)
    else
      @right_node = Node.new(weight, name, @depth + 1)
     return @right_node.depth
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
    conclusion[:weight_found]
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

  def number_of_children(children =  {value: 0 })
    if @left_node
      children[:value] += 1
      @left_node.number_of_children(children)
    end
    if @right_node
      children[:value] += 1
      @right_node.number_of_children(children)
    end
    children[:value]
  end

  def health_of_node(depth, conclusion, max)
    @left_node.health_of_node(depth, conclusion, max) if @left_node
    if depth == @depth
      conclusion[:health] << [@weight,
                              1 + number_of_children,
                              (((1+number_of_children)/max.to_f) * 100).floor]
    end
    @right_node.health_of_node(depth, conclusion, max) if @right_node
  end

  def leaves(conclusion)
    if !@right_node && !@left_node
      conclusion[:number_of_leaves] += 1
    end
    @right_node.leaves(conclusion) if @right_node
    @left_node.leaves(conclusion) if @left_node
  end

  def height(conclusion)
    if !@left_node && !@right_node
      if conclusion[:depth] < @depth
        conclusion[:depth] = @depth
      end
    end
    if @left_node
      @left_node.height(conclusion)
    end
    if @right_node
      @right_node.height(conclusion)
    end
  end

  def delete(weight)
    if @weight == weight
      @name = nil
    end
    if @left_node
      @left_node.delete(weight)
    end
    if @right_node
      @right_node.delete(weight)
    end
  end

end
