class Graph
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def add_edge(node1, node2)
    node1
  end

  class Node
    attr_reader :value, :adjacents

    def initialize(value)
      @value = value
    end
  end
end
