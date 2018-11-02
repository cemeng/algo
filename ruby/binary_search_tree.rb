class BST
  attr_reader :nodes, :root

  def initialize
    @root = nil
  end

  def insert(value)
    return @root = Node.new(value) unless @root
    @root.insert(value)
  end

  # From interview cake
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

  def visit(node)
    p "visiting #{node.value}"
  end

  def in_order_traversal(start_node)
    in_order_traversal(start_node.left) if start_node.left
    visit(start_node)
    in_order_traversal(start_node.right) if start_node.right
  end

  def pre_order_traversal(start_node)
    visit(start_node)
    in_order_traversal(start_node.left) if start_node.left
    in_order_traversal(start_node.right) if start_node.right
  end

  def post_order_traversal(start_node)
    in_order_traversal(start_node.left) if start_node.left
    in_order_traversal(start_node.right) if start_node.right
    visit(start_node)
  end

  def depth_first_search(start_node)

  end

  class Node
    attr_reader :value, :left, :right

    def initialize(value)
      @value = value
    end

    # This is what makes BST different to normal binary tree.
    # In binary tree, you would have to specify whether to insert right or left.
    def insert(new_value)
      if new_value > @value
        @right ? @right.insert(new_value) : (@right = Node.new(new_value))
      else
        @left ? @left.insert(new_value) : (@left = Node.new(new_value))
      end
    end
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
puts "    10    "
puts "   /  \\   "
puts " 1     20 "
puts "      /  \\"
puts "    15    38"
puts "         /  \\"
puts "       65    75"
puts "            /"
puts "          73"
# p "2nd largest is #{tree.find_2nd_largest(tree.root).value}"

p "in order traversal"
tree.in_order_traversal(tree.root)
p "post order traversal"
tree.post_order_traversal(tree.root)
p "pre order traversal"
tree.pre_order_traversal(tree.root)

