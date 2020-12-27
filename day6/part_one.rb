require_relative '../helpers'

module Day6
  class PartOne
    include FileHelpers

    def initialize(filepath:)
      @filepath = filepath
    end

    def solve
      input = read_file(@filepath)
      count_yes_by_group(input).sum
    end

    def count_yes_by_group(input)
      groups = input.split("\n\n")
      groups.map do |group|
        group.gsub("\n", '').split('').uniq.count
      end
    end
  end
end
