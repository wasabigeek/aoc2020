require 'rspec'
require_relative './part_one.rb'

RSpec.describe Day5::PartOne do
  describe '#partition_row' do
    it 'sets the correct rows' do
      part_one = described_class.new
      part_one.partition_row('F')
      expect(part_one.row_upper_bound).to eq(63)
      expect(part_one.row_lower_bound).to eq(0)
      # part_one.partition_row('B')
      # expect(part_one.row_upper_bound).to eq(63)
      # expect(part_one.row_lower_bound).to eq(32)
    end
  end
end
