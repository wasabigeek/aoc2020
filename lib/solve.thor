class Solve < Thor::Group
  include Thor::Actions

  # Define arguments and options
  argument :day

  def self.source_root
    File.dirname(__FILE__)
  end

  def solve
    require_relative "../day#{day}/part_one.rb"
    klass = Object.const_get("Day#{day}::PartOne")
    puts "Part 1: #{klass.new(filepath: "day#{day}/input.txt").solve}"

    require_relative "../day#{day}/part_two.rb"
    klass = Object.const_get("Day#{day}::PartTwo")
    puts "Part 2: #{klass.new(filepath: "day#{day}/input.txt").solve}"
  end
end