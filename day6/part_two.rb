require_relative '../helpers'

module Day6
  class PartTwo
    include FileHelpers

    def initialize(filepath: nil)
      @filepath = filepath
    end

    def solve
      input = read_file(@filepath)
      count_yes_by_group(input).sum
    end

    def count_yes_by_group(input)
      groups = input.split("\n\n")
      # assumption: no repeat questions per person
      groups.map do |group|
        persons_count = group.split("\n").count

        # kinda like a counting sort
        group.gsub("\n", '')
             .split('')
             .group_by(&:to_s)
             .select { |question, grouped| grouped.count == persons_count }
             .keys
             .count
      end
    end
  end
end
