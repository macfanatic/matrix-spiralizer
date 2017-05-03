require 'spec_helper'

RSpec.describe Matrix, type: :model do
  describe '.storage' do
    subject { described_class.new(rows, columns).storage }

    context '1x1' do
      let(:rows)    { 1 }
      let(:columns) { 1 }

      it 'is a simple array' do
        expect(subject).to eq([ [1] ])
      end
    end

    context '10x10' do
      let(:rows)    { 10 }
      let(:columns) { 10 }

      it 'has 10 rows' do
        expect(subject.size).to eq(10)
      end

      it 'has 10 items in each row' do
        expect(subject).to be_all { |row| row.size == 10 }
      end

      it 'starts each row with the correct digit' do
        subject.each do |row|
          expect(row[0] % 10).to eq(1)
        end
      end
    end

    context '2x10' do
      let(:rows)    { 2 }
      let(:columns) { 10 }

      it 'has 2 rows' do
        expect(subject.size).to eq(2)
      end

      it 'has 10 items in each row' do
        expect(subject).to be_all { |row| row.size == 10 }
      end

      it 'starts each row with the correct digit' do
        subject.each do |row|
          expect(row[0] % 10).to eq(1)
        end
      end
    end

    context '10x1' do
      let(:rows)    { 10 }
      let(:columns) { 1 }

      it 'has 10 rows' do
        expect(subject.size).to eq(10)
      end

      it 'has 1 item in each row' do
        expect(subject).to be_all { |row| row.size == 1 }
      end

      it 'starts each row with the correct digit' do
        subject.each_with_index do |row, index|
          expect(row[0]).to eq(index + 1)
        end
      end
    end
  end
end
