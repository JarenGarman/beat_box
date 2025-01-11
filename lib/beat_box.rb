# frozen_string_literal: true

require_relative 'linked_list'

# The main Beat Box functionality
class BeatBox
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(beats = '')
    @list = LinkedList.new
    @rate = 500
    @voice = 'Boing'
    append(beats)
  end

  def append(beats)
    beats.split.each do |beat|
      @list.append(beat)
    end
  end

  def play
    `say -r #{@rate} -v #{@voice} "#{@list.to_string}"`
  end

  def count
    @list.count
  end
end
