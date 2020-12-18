require_relative '../helpers'

module Day5
  class PartOne
    attr_accessor :row_upper_bound, :row_lower_bound

    include FileHelpers

    def initialize
      @row_upper_bound = 127
      @row_lower_bound = 0
    end

    def partition_row(instruction)
      @row_upper_bound = 63
    end
  end
end
