class BST
  attr_reader :nodes, :root

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
    # The assumption is: that start_node is the root of the tree.
    # Use recursive approach - can also be done iteratively.
    # Using the example, to find 2nd largest number
    # - find the largest number first (right.node == null)
    # - the 2nd largest would be either the parent of this max node if left.node == null
    # - or the largest number on the left node of this largest number node
    # Approach - we are keeping parent_node
    #
    # Time complexity: O(log n) as we are halving the search area in each level
    # Space complexity: Possibly O(log n) as we are keeping variable in each level to keep track of the parent node

    return start_node if !start_node.left && !start_node.right

    right_most, parent_node = right_most(start_node.right, start_node)
    if right_most.left == nil
      return parent_node
    else
      right_most, parent_node = right_most(right_most.left, parent_node)
      return right_most
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
#tree.insert(15)
tree.insert(1)
#tree.insert(38)
#tree.insert(75)
#tree.insert(73)
#tree.insert(65)
# p tree.inspect
#    10
#  1    20
#     15  38
#       65  75
#         73
p "2nd largest is #{tree.find_2nd_largest(tree.root).value}"

# find the second largest value -> do I need to traverse the whole tree?
# No, I only need to find the two rightmost.
# The pseudo code: I need to find the rightmost, when I found it I want to go up a parent and
# traverse up until I have found a node that has left node and then I perform rightmost.
# if the parent node doesn't have a left node, then it is the 2nd largest number.
