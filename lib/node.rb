# frozen_string_literal: true

# Create a node for our linked list
class Node
  attr_reader :data, :next_node

  def initialize(data)
    @data = data
  end
end
