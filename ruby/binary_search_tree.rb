class BST
  attr_reader :nodes

  class Node
    attr_reader :value, :left, :right

    def initialize(value)
      @value = value
    end

    def insert(new_value)
      if new_value > @value
        @right ? @right.insert(new_value) : (@right = Node.new(new_value))
      else
        @left ? @left.insert(new_value) : (@left = Node.new(new_value))
      end
    end
  end

  def initialize
    @root = nil
  end

  def insert(value)
    return @root = Node.new(value) unless @root
    @root.insert(value)
  end

  def find_2nd_largest(start_node)
    # using recursive - can also be done iteratively
    # I am thinking may iteratively is better as I need to remember state.
    right_most, parent_node = right_most(start_node)
    if parent_node.left == nil
      return parent_node
    else
      right_most, parent_node = right_most(start_node.left)
      return parent_node
    end
  end

  def right_most(node, parent_node)
    return right_most(node.right, node) if node.right
    return node, parent_node
  end

end

tree = BST.new
tree.insert(10)
tree.insert(20)
tree.insert(15)
tree.insert(1)
tree.insert(38)
tree.insert(75)
tree.insert(73)
tree.insert(65)
p tree.inspect
#    10
#  1    20
#     15  38
#       65  75
#         73
p tree.find_2nd_largest(tree.root)

# find the second largest value -> do I need to traverse the whole tree?
# No, I only need to find the two rightmost.
# The pseudo code: I need to find the rightmost, when I found it I want to go up a parent and
# traverse up until I have found a node that has left node and then I perform rightmost.
# if the parent node doesn't have a left node, then it is the 2nd largest number.
