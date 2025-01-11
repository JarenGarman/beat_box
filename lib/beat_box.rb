# frozen_string_literal: true

require_relative 'linked_list'

# The main Beat Box functionality
class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end
end
