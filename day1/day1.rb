require 'set'

module Part1
  def self.multiply_matching_entries_in_file(path)
    # REFACTOR: instead of loading the entire file, see if it's possible to stream somehow? Since the approach seems to fine making a single pass
    expanded_path = File.expand_path(path, File.expand_path(File.dirname(__FILE__)))
    input = File.readlines(expanded_path).map(&:to_i)
    multiply_matching_entries(input)
  end

  def self.multiply_matching_entries(input)
    possible_matches = Set.new

    input.each do |i|
      if possible_matches.include?(i)
        return (2020 - i) * i
      else
        possible_matches.add(2020 - i)
      end
    end
  end
end

module Part2
  Edge = Struct.new(:to, :from)

  def self.multiply_matching_entries_in_file(path)
    # REFACTOR: instead of loading the entire file, see if it's possible to stream somehow? Since the approach seems to fine making a single pass
    expanded_path = File.expand_path(path, File.expand_path(File.dirname(__FILE__)))
    input = File.readlines(expanded_path).map(&:to_i)
    multiply_matching_entries(input)
  end

  def self.multiply_matching_entries(input)
    vertexes = []
    edges = {}
    input.each do |i|
      return i * edges[i].to * edges[i].from if edges[i]

      vertexes.each do |v|
        edges[2020 - i - v] = Edge.new(i, v)
      end
      vertexes << i
    end
  end
end

# puts Part2.multiply_matching_entries_in_file('input.txt')
