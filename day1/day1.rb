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
