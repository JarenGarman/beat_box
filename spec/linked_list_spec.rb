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

    it 'has empty to_string' do
      expect(list.to_string).to eq('')
    end
  end

  describe '#prepend' do
    it 'can add a node to an empty list' do
      list.prepend('dop')

      expect(list.head.data).to eq('dop')
    end

    it 'can add a node to the beginning' do
      list.append('plop')
      list.append('suu')
      list.prepend('dop')

      expect(list.head.data).to eq('dop')
    end
  end

  describe '#append' do
    it 'can add a node to the end' do
      list.append('doop')

      expect(list.head).to be_instance_of Node
    end

    it 'can add multiple nodes' do
      list.append('doop')
      list.append('deep')

      expect(list.head.next_node).to be_instance_of Node
    end
  end

  describe '#insert' do
    it 'can insert to a particular position' do
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(1, 'woo')

      expect(list.to_string).to eq('dop woo plop suu')
    end

    it 'can accept negative number' do
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(-2, 'woo')

      expect(list.to_string).to eq('dop woo plop suu')
    end

    it "cannot insert to position that doesn't exist" do
      list.append('plop')
      list.append('suu')
      list.prepend('dop')

      expect(list.insert(5, 'woo')).to be_nil
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
    it 'can convert single node to string' do
      list.append('doop')

      expect(list.to_string).to eq('doop')
    end

    it 'can convert list to string' do
      list.append('doop')
      list.append('deep')

      expect(list.to_string).to eq('doop deep')
    end
  end

  describe '#find' do
    before do
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')
    end

    it 'can find one element' do
      expect(list.find(2, 1)).to eq('shi')
    end

    it 'can find multiple elements' do
      expect(list.find(1, 3)).to eq('woo shi shu')
    end

    it 'cannot find with impossible index' do
      expect(list.find(5, 1)).to be_nil
    end

    it 'can find with negative index' do
      expect(list.find(-3, 1)).to eq('shi')
    end

    it 'stops at end of list' do
      expect(list.find(3, 5)).to eq('shu blop')
    end
  end

  describe '#includes?' do
    before do
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')
    end

    context 'when list includes arg' do
      it 'returns true' do
        expect(list.includes?('deep')).to be true
      end
    end

    context 'when list does not include arg' do
      it 'returns true' do
        expect(list.includes?('dep')).to be false
      end
    end
  end

  describe '#pop' do
    before do
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')
    end

    it 'returns data of tail node' do
      expect(list.pop).to eq('blop')
    end

    it 'removes tail node' do
      list.pop

      expect(list.to_string).to eq('deep woo shi shu')
    end

    it 'cannot pop from empty list' do
      empty_list = described_class.new

      expect(empty_list.pop).to be_nil
    end
  end
end
