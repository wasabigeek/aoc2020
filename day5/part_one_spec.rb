require 'rspec'
require_relative './part_one.rb'

RSpec.describe Day5::BoardingPass do
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

  describe '#process' do
    it 'returns the correct row, column and seat ID' do
      row, col, seat_id = described_class.new('BFFFBBFRRR').process
      expect(row).to eq(70)
      expect(col).to eq(7)
      expect(seat_id).to eq(567)

      row, col, seat_id = described_class.new('FFFBBBFRRR').process
      expect(row).to eq(14)
      expect(col).to eq(7)
      expect(seat_id).to eq(119)

      row, col, seat_id = described_class.new('BBFFBBFRLL').process
      expect(row).to eq(102)
      expect(col).to eq(4)
      expect(seat_id).to eq(820)
    end
  end
end

RSpec.describe Day5::PartOne do
  describe '#calculate_seat_ids' do
    it 'returns the correct seat ids' do
      expect(described_class.new.calculate_seat_ids('day5/example.txt')).to eq([567, 119, 820])
    end
  end
end
