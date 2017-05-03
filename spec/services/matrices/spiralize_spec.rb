require 'spec_helper'

RSpec.describe Matrices::Spiralize, type: :service do
  describe '.perform' do
    subject { described_class.perform(matrix) }

    context '1x1' do
      let(:matrix) { Matrix.new(1,2) }

      it { is_expected.to be_a(Array) }
      it { is_expected.to eq(%w(1 2).map(&:to_i)) }
    end

    context '5x5' do
      let(:matrix) { Matrix.new(5,5) }

      it { is_expected.to be_a(Array) }
      it { is_expected.to eq(%w(1  2  3  4  5  10  15  20  25  24  23  22  21  16  11  6  7  8  9  14  19  18  17  12  13).map(&:to_i)) }
    end
  end
end
