# class Stack
#   attr_reader :items
#
#   def initialize
#     # we can implement this as array.
#     @items = []
#   end
#
#   # O(1)
#   def pop
#     last_item = @items[@items.length-1]
#     @items.delete_at(@items.length-1)
#     last_item
#     items.slice!(items.length-1)
#   end
#
#   # O(1)
#   def push(item)
#     items << item
#   end
# end
#
# class Queue
#   attr_reader :items
#   # array unshift putting items in front of the array - note this is returning new array
#   # array shift removing items in front of the array - note returning new array
#   # array slice!(index)
#
#   def initialize
#     @items = []
#   end
#
#   def enqueue(item)
#     items << item
#   end
#
#   def dequeue
#     items.shift
#   end
# end

# Requirement implement stack without using array
# but just using linked list
class Stack
  attr_reader :top_node

  # implemented as linked list?
  class Node
    attr_reader :value, :next

    def initialize(value)
      @value = value
    end

    def next=(node)
      @next = node
    end
  end

  def initialize
    @top_node = nil
  end

  def push(value)
    node = Node.new(value)
    node.next = @top_node
    @top_node = node
  end

  def pop
    return "stack empty" unless @top_node
    value = @top_node.value
    @top_node = @top_node.next
    value
  end
end

stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)
p stack.pop
p stack.pop
p stack.pop
p stack.pop


# DFS

