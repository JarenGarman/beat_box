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
    current_node = @head
    (index - 1).times do
      current_node = current_node.next_node
    end
    before_node = current_node
    after_node = before_node.next_node
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

  def find(index, amount) # rubocop:disable Metrics/MethodLength
    index = count + index if index.negative?

    return if index > count - 1

    start_node = @head
    index.times do
      start_node = start_node.next_node
    end
    string = start_node.data
    if amount > 1
      current_node = start_node.next_node
      string = "#{string} #{current_node.data}"
      (amount - 2).times do
        break unless current_node.next_node

        current_node = current_node.next_node
        string = "#{string} #{current_node.data}"
      end
    end
    string.strip

    # list_to_array[index..(index + amount - 1)].map do |node|
    #   node.data
    # end.join(' ')
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

  def pop # rubocop:disable Metrics/MethodLength
    return unless @head

    current_node = @head
    current_node = current_node.next_node while current_node.next_node
    data_to_return = current_node.data
    last_node = current_node
    if count == 1
      @head = nil
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node == last_node
      current_node.remove_next_node
    end
    data_to_return
  end
end
