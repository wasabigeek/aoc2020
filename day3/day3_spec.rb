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
      right, down = 3, 1
      input = [
        '....',
        '...#',
        '..#.'
      ]
      expect(PartTwo.new.count_trees_in_path(input, right, down)).to eq(2)
    end
  end

  describe '#count_trees_from_file' do
    it 'returns the correct count for the original slope' do
      right, down = 3, 1
      expect(PartTwo.new.count_trees_from_file('day3/example.txt', right, down)).to eq(7)
    end
  end
end
