# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe LinkedList do
  subject(:list) { described_class.new }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has no head' do
      expect(list.head).to be_nil
    end
  end
end
