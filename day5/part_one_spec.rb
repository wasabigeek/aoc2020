require 'rspec'
require_relative './part_one.rb'

RSpec.describe Day5::PartOne do
  describe '#partition_once' do
    it 'sets the correct rows' do
      part_one = described_class.new
      expect(part_one.row_upper_bound).to eq(127)
      expect(part_one.row_lower_bound).to eq(0)
      part_one.partition_once('F')
      expect(part_one.row_upper_bound).to eq(63)
      expect(part_one.row_lower_bound).to eq(0)
      part_one.partition_once('B')
      expect(part_one.row_upper_bound).to eq(63)
      expect(part_one.row_lower_bound).to eq(32)
      part_one.partition_once('F')
      expect(part_one.row_upper_bound).to eq(47)
      expect(part_one.row_lower_bound).to eq(32)
      part_one.partition_once('B')
      expect(part_one.row_upper_bound).to eq(47)
      expect(part_one.row_lower_bound).to eq(40)
      part_one.partition_once('B')
      expect(part_one.row_upper_bound).to eq(47)
      expect(part_one.row_lower_bound).to eq(44)
      part_one.partition_once('F')
      expect(part_one.row_upper_bound).to eq(45)
      expect(part_one.row_lower_bound).to eq(44)
      part_one.partition_once('F')
      expect(part_one.row_upper_bound).to eq(44)
      expect(part_one.row_lower_bound).to eq(44)

      expect(part_one.col_upper_bound).to eq(7)
      expect(part_one.col_lower_bound).to eq(0)
      part_one.partition_once('R')
      expect(part_one.col_upper_bound).to eq(7)
      expect(part_one.col_lower_bound).to eq(4)
      part_one.partition_once('L')
      expect(part_one.col_upper_bound).to eq(5)
      expect(part_one.col_lower_bound).to eq(4)
      part_one.partition_once('R')
      expect(part_one.col_upper_bound).to eq(5)
      expect(part_one.col_lower_bound).to eq(5)
    end
  end
end
