# frozen_string_literal: true

require_relative 'node'

# Create a Linked List in Ruby!
class LinkedList
  def initialize
    @list = []
  end

  def head
    @list[0]
  end

  def append(data)
    @list << Node.new(data)
  end

  def count
    @list.count
  end
end
