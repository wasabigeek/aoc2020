require 'rspec'
require_relative './day1.rb'

RSpec.describe 'part 1' do
  describe '#multiply_matching_entries' do
    it 'multiples entries when both add to 2020' do
      input = [
        2019,
        1
      ]
      expect(Part1.new.multiply_matching_entries(input)).to eq(2019)
    end

    it 'multiplies the correct entries when there are others' do
      input = [
        2019,
        2,
        1,
        3
      ]
      expect(Part1.new.multiply_matching_entries(input)).to eq(2019)
    end

    it 'multiplies the correct entries' do
      input = [
        1721,
        979,
        366,
        299,
        675,
        1456
      ]
      expect(Part1.new.multiply_matching_entries(input)).to eq(514579)
    end
  end

  describe '#multiply_matching_entries_in_file' do
    it 'multiplies the correct entries' do
      expect(Part1.new.multiply_matching_entries_in_file('day1/example.txt')).to eq(514579)
    end
  end
end

RSpec.describe 'Part2' do
  describe '#multiply_matching_entries' do
    it 'multiplies the correct entries' do
      input = [
        1721,
        979,
        366,
        299,
        675,
        1456
      ]
      expect(Part2.multiply_matching_entries(input)).to eq(241861950)
    end
  end
end
