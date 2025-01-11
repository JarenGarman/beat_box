# frozen_string_literal: true

require_relative 'node'

# Create a Linked List in Ruby!
class LinkedList
  attr_reader :head

  def append(data)
    @head = Node.new(data)
  end
end
