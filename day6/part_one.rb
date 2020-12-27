require_relative '../helpers'

module Day6
  class PartOne
    include FileHelpers

    def count_yes_by_group(input)
      groups = input.split("\n\n")
      groups.map do |group|
        group.gsub("\n", '').split('').uniq.count
      end
    end
  end
end
