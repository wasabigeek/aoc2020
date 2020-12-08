require_relative '../helpers'

class PartOne
  include FileHelpers

  INPUT_REGEX = /(\d+)-(\d+) ([a-z]): ([a-z]+)/

  def check_passwords_in_file(path)
    passwords = readlines_from_file(path)
    valid_passwords = passwords.reduce(0) do |count, password|
      count += 1 if check_password(password)
      count
    end
  end

  # Could do this in one pass through the string - but this is at least a bit more readable
  # Also, it's not _really_ a password that is input, but I'll leave the naming decision for another day
  def check_password(input)
    _, min_str, max_str, letter, password = input.match(INPUT_REGEX).to_a
    min, max = min_str.to_i, max_str.to_i

    matches = password.split('').reduce(0) do |count, char|
      count += 1 if char == letter
      count
    end

    matches <= max && matches >= min
  end
end

class PartTwo
  include FileHelpers

  INPUT_REGEX = /(\d+)-(\d+) ([a-z]): ([a-z]+)/

  def check_passwords_in_file(path)
    passwords = readlines_from_file(path)
    valid_passwords = passwords.reduce(0) do |count, password|
      count += 1 if check_password(password)
      count
    end
  end

  def check_password(input)
    # resisting the desire to abstract a Policy for now
    _, first_index_str, second_index_str, letter, password = input.match(INPUT_REGEX).to_a
    first_index, second_index = first_index_str.to_i - 1, second_index_str.to_i - 1

    [
      password[first_index],
      password[second_index]
    ].count { |char| char == letter } == 1
  end
end

# puts PartOne.new.check_passwords_in_file('day2/input.txt')
