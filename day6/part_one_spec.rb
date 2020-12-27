require 'rspec'
require_relative './part_one.rb'

RSpec.describe Day6::PartOne do
  describe '#count_yes_by_group' do
    it 'returns unique counts' do
      input = <<~INPUT
        abc

        a
        b
        c

        ab
        ac

        a
        a
        a
        a

        b
      INPUT

      result = described_class.new.count_yes_by_group(input)
      expect(result).to eq([3, 3, 3, 1, 1])
    end
  end

  describe '#solve' do
    it 'sums the count of unique questions per group' do
      result = described_class.new(filepath: 'day6/example.txt').solve
      expect(result).to eq(11)
    end
  end
end
