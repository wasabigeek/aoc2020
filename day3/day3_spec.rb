require 'rspec'
require_relative './day3.rb'

RSpec.describe PartOne do
  describe '#count_trees_in_path' do
    it 'returns zero for single traversal with no trees' do
      input = [
        '.###',
        '###.'
      ]
      expect(PartOne.new.count_trees_in_path(input)).to eq(0)
    end

    it 'returns 1 for single traversal with a tree' do
      input = [
        '.###',
        '...#'
      ]
      expect(PartOne.new.count_trees_in_path(input)).to eq(1)
    end

    it 'returns the correct count when terrain repeats horizontally' do
      input = [
        '....',
        '...#',
        '..#.'
      ]
      expect(PartOne.new.count_trees_in_path(input)).to eq(2)
    end
  end

  describe '#count_trees_from_file' do
    it 'returns the correct count' do
      expect(PartOne.new.count_trees_from_file('day3/example.txt')).to eq(7)
    end
  end
end

RSpec.describe PartTwo do
  describe '#count_trees_in_path' do
    it 'returns the correct count for original slope' do
      slope = described_class::Slope.new(3, 1)
      input = [
        '....',
        '...#',
        '..#.'
      ]
      expect(PartTwo.new.count_trees_in_path(input, slope)).to eq(2)
    end

    it 'returns the correct count for other slopes' do
      slope = described_class::Slope.new(1, 1)
      input = [
        '....',
        '...#',
        '..#.'
      ]
      expect(PartTwo.new.count_trees_in_path(input, slope)).to eq(1)
    end
  end

  describe '#count_trees_from_file' do
    it 'returns the correct count for the original slope' do
      slope = described_class::Slope.new(3, 1)
      expect(PartTwo.new.count_trees_from_file('day3/example.txt', slope)).to eq(7)
    end

    it 'returns the correct count for different slopes' do
      slope = described_class::Slope.new(1, 1)
      expect(PartTwo.new.count_trees_from_file('day3/example.txt', slope)).to eq(2)
      slope = described_class::Slope.new(5, 1)
      expect(PartTwo.new.count_trees_from_file('day3/example.txt', slope)).to eq(3)
      slope = described_class::Slope.new(7, 1)
      expect(PartTwo.new.count_trees_from_file('day3/example.txt', slope)).to eq(4)
      slope = described_class::Slope.new(1, 2)
      expect(PartTwo.new.count_trees_from_file('day3/example.txt', slope)).to eq(2)
    end
  end

  describe '#multiply_trees_across_slopes' do
    it 'returns the correct count' do
      slope = described_class::Slope.new(1, 1)
      expect(PartTwo.new.multiply_trees_across_slopes('day3/example.txt')).to eq(336)
    end
  end
end
