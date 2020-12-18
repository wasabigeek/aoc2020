require_relative '../helpers'

module Day5
  class PartOne
    attr_accessor :row_upper_bound, :row_lower_bound
    attr_accessor :col_upper_bound, :col_lower_bound

    include FileHelpers

    def initialize
      @row_upper_bound = 127
      @row_lower_bound = 0
      @col_upper_bound = 7
      @col_lower_bound = 0
    end

    def partition_once(instruction)
      if ['F', 'B'].include? instruction
        mid = (row_lower_bound.to_f + row_upper_bound.to_f) / 2

        if instruction == 'F'
          @row_upper_bound = mid.floor
        elsif instruction == 'B'
          @row_lower_bound = mid.ceil
        end
      end

      if ['L', 'R'].include? instruction
        mid = (col_lower_bound.to_f + col_upper_bound.to_f) / 2

        if instruction == 'L'
          @col_upper_bound = mid.floor
        elsif instruction == 'R'
          @col_lower_bound = mid.ceil
        end
      end
    end
  end
end
