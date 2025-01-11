# frozen_string_literal: true

require_relative 'node'

# Create a Linked List in Ruby!
class LinkedList
  attr_reader :head

  def append(data)
    if @head
      @head.add_next_node(Node.new(data))
    else
      @head = Node.new(data)
    end
  end

  def count
    @list.count
  end

  def to_string
    @list.map do |node|
      node.data
    end.join
  end
end
