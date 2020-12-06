require 'set'

def multiply_matching_entries_in_file(path)
  # REFACTOR: instead of loading the entire file, see if it's possible to stream somehow? Since the approach seems to fine making a single pass
  expanded_path = File.expand_path(path, File.expand_path(File.dirname(__FILE__)))
  input = File.readlines(expanded_path).map(&:to_i)
  multiply_matching_entries(input)
end

def multiply_matching_entries(input)
  possible_matches = Set.new

  input.each do |i|
    if possible_matches.include?(i)
      return (2020 - i) * i
    else
      possible_matches.add(2020 - i)
    end
  end
end

# puts multiply_matching_entries_in_file('input.txt')
