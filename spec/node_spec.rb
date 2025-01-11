# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Node do
  subject(:node) { described_class.new('plop') }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has data' do
      expect(node.data).to eq('plop')
    end
  end
end
