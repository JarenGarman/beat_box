# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe BeatBox do
  subject(:bb) { described_class.new }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has a list' do
      expect(bb.list).to be_instance_of LinkedList
    end

    it 'has 0 beats' do
      expect(bb.count).to eq(0)
    end

    it 'can initialize with beats' do
      new_bb = described_class.new('deep dop dop deep')

      expect(new_bb.list.to_string).to eq('deep dop dop deep')
    end

    it 'has rate of 500' do
      expect(bb.rate).to eq(500)
    end

    it 'has voice of Boing' do
      expect(bb.voice).to eq('Boing')
    end
  end

  describe '#append' do
    it 'can split input and create multiple nodes' do
      bb.append('deep doo ditt')

      expect(bb.list.head.next_node.data).to eq('doo')
    end

    it 'can create single node' do
      bb.append('deep')

      expect(bb.list.count).to eq(1)
    end
  end

  describe '#prepend' do
    it 'can split input and create multiple nodes' do
      bb.append('deep')
      bb.prepend('deep doo ditt')

      expect(bb.list.head.next_node.data).to eq('doo')
    end

    it 'can create single node' do
      bb.prepend('deep')

      expect(bb.list.count).to eq(1)
    end
  end

  describe '#count' do
    it 'can count beats' do
      bb.append('deep doo ditt woo hoo shu')

      expect(bb.count).to eq(6)
    end
  end

  describe '#rate' do
    it 'can change rate' do
      bb.rate = 100

      expect(bb.rate).to eq(100)
    end
  end

  describe '#voice' do
    it 'can change voice' do
      bb.voice = 'Daniel'

      expect(bb.voice).to eq('Daniel')
    end
  end

  describe '#reset_rate' do
    it 'can reset rate' do
      bb.rate = 100
      bb.reset_rate

      expect(bb.rate).to eq(500)
    end
  end

  describe '#reset_voice' do
    it 'can reset voice' do
      bb.voice = 'Daniel'
      bb.reset_voice

      expect(bb.voice).to eq('Boing')
    end
  end

  describe '#all' do
    it 'can list beats' do
      bb = described_class.new('deep')
      bb.prepend('tee tee tee Mississippi')

      expect(bb.all).to eq('tee tee tee deep')
    end
  end
end
