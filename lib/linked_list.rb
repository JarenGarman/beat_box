# frozen_string_literal: true

require_relative 'node'

# Create a Linked List in Ruby!
class LinkedList
  attr_reader :head

  def prepend(data)
    if @head
      old_head = @head
      @head = Node.new(data)
      @head.add_next_node(old_head)
    else
      @head = Node.new(data)
    end
  end

  def append(data)
    if @head
      list_to_array.last.add_next_node(Node.new(data))
    else
      @head = Node.new(data)
    end
  end

  def insert(index, data)
    return if index > count - 1

    new_node = Node.new(data)
    before_node, after_node = list_to_array[(index - 1)..index]
    before_node.add_next_node(new_node)
    new_node.add_next_node(after_node)
  end

  def count
    list_to_array.count
  end

  def to_string
    return '' unless @head

    list_to_array.map do |node|
      node.data
    end.join(' ')
  end

  private

  def list_to_array
    return [] unless @head

    list = [@head]
    current_node = @head
    while current_node.next_node
      list << current_node.next_node
      current_node = current_node.next_node
    end
    list
  end
end
