require_relative '../helpers'

class PartOne
  include FileHelpers

  def check_passwords_in_file(path)
    passwords = readlines_from_file(path)
    valid_passwords = passwords.reduce(0) do |count, password|
      count += 1 if check_password(password)
      count
    end
  end

  def check_password(input)
    # Could do this in one pass through the string - not sure how much complexity #split adds, but this is at least a bit more readable
    policy_str, password = input.split(': ')
    minmax_str, letter = policy_str.split(' ')
    min, max = minmax_str.split('-').map(&:to_i)

    matches = password.split('').reduce(0) do |count, char|
      count += 1 if char == letter
      count
    end

    matches <= max && matches >= min
  end
end

class PartTwo
  include FileHelpers

  def check_passwords_in_file(path)
    passwords = readlines_from_file(path)
    valid_passwords = passwords.reduce(0) do |count, password|
      count += 1 if check_password(password)
      count
    end
  end

  def check_password(input)
    # resisting the desire to abstract a Policy for now
    policy_str, password = input.split(': ')
    positions_str, checked_letter = policy_str.split(' ')
    first_index, second_index = positions_str
      .split('-')
      .map(&:to_i)
      .map { |p| p - 1 }

    [
      password[first_index],
      password[second_index]
    ].count { |char| char == checked_letter } == 1
  end
end

# puts PartOne.new.check_passwords_in_file('day2/input.txt')
