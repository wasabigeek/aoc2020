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
end
