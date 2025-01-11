# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe BeatBox do
  subject(:bb) { described_class.new }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has a list' do
      expect(bb.list).to be_instance_of LinkedList
    end
  end
end
