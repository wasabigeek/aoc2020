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
    puts klass.new(filepath: "day#{day}/input.txt").solve
  end
end