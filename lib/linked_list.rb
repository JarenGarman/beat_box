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
      current_node = @head
      current_node = current_node.next_node while current_node.next_node
      current_node.add_next_node(Node.new(data))
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

  def count # rubocop:disable Metrics/MethodLength
    if @head
      count = 1
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
        count += 1
      end
      count
    else
      0
    end
  end

  def to_string
    string = ''
    if @head
      current_node = @head
      while current_node.next_node
        string = "#{string} #{current_node.data}"
        current_node = current_node.next_node
      end
      string = "#{string} #{current_node.data}".strip
    end
    string
  end

  def find(index, amount)
    return if index > count - 1

    list_to_array[index..(index + amount - 1)].map do |node|
      node.data
    end.join(' ')
  end

  def includes?(string_param)
    bool = false
    if @head
      current_node = @head
      bool = true if current_node.data == string_param
      while current_node.next_node
        bool = true if current_node.data == string_param
        current_node = current_node.next_node
      end
    end
    bool
  end

  def pop
    return unless @head

    data_to_return = list_to_array.last.data
    if count == 1
      @head = nil
    else
      list_to_array[-2].remove_next_node
    end
    data_to_return
  end
end
