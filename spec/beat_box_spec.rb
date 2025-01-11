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

  describe '#count' do
    it 'can count beats' do
      bb.append('deep doo ditt woo hoo shu')

      expect(bb.count).to eq(6)
    end
  end
end
