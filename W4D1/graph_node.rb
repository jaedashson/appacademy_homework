require "set"

class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val)
    @val = val
    @neighbors = []
  end    
    
end

def bfs(starting_node, target_value)
  visited = Set.new()

  queue = [starting_node]

  until queue.empty?
    current_node = queue.shift

    next if visited.include?(current_node)

    puts "Searching node #{current_node.val}"

    visited.add(current_node)

    if current_node.val == target_value
      return current_node
    else
      starting_node.neighbors.each { |neighbor| queue << neighbor }
    end
  end

  nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")

p bfs(a, "f")