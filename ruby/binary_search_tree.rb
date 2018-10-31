class BST

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

# find the second largest value -> do I need to traverse the whole tree?
# no actually I don't, I just need to travel to go right all the time until there is no more right node
# but I have to remember previous node as I want to return that as the result
# actually this is wrong
# I should traverse the right side of the tree on the edge
