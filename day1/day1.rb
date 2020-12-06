def multiply_matching_entries(input)
  input.each do |i|
    input.each do |j|
      if (i + j) == 2020
        return i * j
      end
    end
  end
end
