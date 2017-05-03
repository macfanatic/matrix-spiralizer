require 'spec_helper'

RSpec.describe IndexPath, type: :model do
  describe '#[]' do
    subject { described_class[1,2] }

    it { is_expected.to be_an(IndexPath) }

    it 'set the row correctly' do
      expect(subject.row).to eq(1)
    end

    it 'set the column correctly' do
      expect(subject.column).to eq(2)
    end
  end
end
