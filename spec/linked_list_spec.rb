# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe LinkedList do
  subject(:list) { described_class.new }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has no head' do
      expect(list.head).to be_nil
    end

    it 'has count of 0' do
      expect(list.count).to eq(0)
    end
  end

  describe '#append' do
    it 'can can add a node' do
      list.append('doop')

      expect(list.head).to be_instance_of Node
    end

    it 'can add multiple nodes' do
      list.append('doop')
      list.append('deep')

      expect(list.head.next_node).to be_instance_of Node
    end
  end

  describe '#count' do
    it 'can count one node' do
      list.append('doop')

      expect(list.count).to eq(1)
    end

    it 'can count two nodes' do
      list.append('doop')
      list.append('deep')

      expect(list.count).to eq(2)
    end
  end

  describe '#to_string' do
    it 'can convert list to string' do
      list.append('doop')

      expect(list.to_string).to eq('doop')
    end
  end
end
