# frozen_string_literal: true

require_relative 'linked_list'

# The main Beat Box functionality
class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(beats)
    beats.split.each do |beat|
      @list.append(beat)
    end
  end
end
