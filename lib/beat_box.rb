# frozen_string_literal: true

require_relative 'linked_list'

# The main Beat Box functionality
class BeatBox
  attr_reader :list

  def initialize(beats = '')
    @list = LinkedList.new
    append(beats)
  end

  def append(beats)
    beats.split.each do |beat|
      @list.append(beat)
    end
  end

  def play
    `say -r 500 -v Boing "#{@list.to_string}"`
  end

  def count
    @list.count
  end
end
