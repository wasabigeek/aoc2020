require_relative '../helpers'

module Day5
  class BoardingPass
    attr_accessor :row_upper_bound, :row_lower_bound
    attr_accessor :col_upper_bound, :col_lower_bound

    def initialize(instructions=nil)
      @instructions = instructions
      @processed = false

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

    def seat_id
      process unless @processed
      row_upper_bound * 8 + col_upper_bound
    end

    def process
      @instructions.split('').each do |instruction|
        partition_once(instruction)
      end
      @processed = true

      [row_upper_bound, col_upper_bound, seat_id]
    end
  end

  class PartOne
    include FileHelpers

    def calculate_seat_ids(filepath)
      readlines_from_file(filepath).map do |instructions|
        BoardingPass.new(instructions).seat_id
      end
    end

    def find_highest_seat_id(filepath)
      calculate_seat_ids(filepath).max
    end
  end
end

# puts Day5::PartOne.new.find_highest_seat_id('day5/input.txt')

# seat_ids = Day5::PartOne.new.calculate_seat_ids('day5/input.txt').sort
# potential = []
# previous_seat = seat_ids.first
# seat_ids.each do |seat_id|
#   if seat_id - previous_seat > 1
#     potential << seat_id
#   end
#   previous_seat = seat_id
# end
# puts potential
# puts potential.first - 1
