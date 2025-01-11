# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Node do
  subject(:node) { described_class.new('plop') }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has data' do
      expect(node.data).to eq('plop')
    end

    it 'has no next node' do
      expect(node.next_node).to be_nil
    end
  end

  describe '#add_next_node' do
    let(:second_node) { described_class.new('doop') }

    it 'can add next node' do
      node.add_next_node(second_node)

      expect(node.next_node).to eq(second_node)
    end
  end

  describe '#remove_next_node' do
    it 'can remove next node' do
      node.remove_next_node

      expect(node.next_node).to be_nil
    end
  end
end
