require_relative '../helpers'

class PartOne
  include FileHelpers

  # def check_passwords_in_file(path)
  #   passwords = readlines_from_file(path)
  #   valid_passwords
  # end

  def check_password(input)
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
