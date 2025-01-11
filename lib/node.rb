# frozen_string_literal: true

# Create a node for our linked list
class Node
  attr_reader :data, :next_node

  def initialize(data)
    @data = data
  end

  def add_next_node(node)
    @next_node = node
  end

  def remove_next_node
    @next_node = nil
  end
end
