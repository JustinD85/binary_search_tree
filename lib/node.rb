
class Node
  attr_reader :weight, :name

  def initialize(name, weight)
    @left_node = nil
    @right_node = nil
    @root = root
    @weight = weight
    @name = name
  end

  def add_node(weight, name)
    
  end

  def has_left_node?
    @left_node
  end

  def has_right_node?
    @right_node
  end

  def add_left_node
  end

  def add_right_node
  end

  def root?
    @root
  end


end
