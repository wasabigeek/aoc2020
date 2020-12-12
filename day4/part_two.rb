require 'set'

module Day4
  class PartTwo
    FIELD_REGEX = /(?<field>\w{3}):(?<value>#?\w+)/
    REQUIRED_FIELDS = Set.new %w[byr iyr eyr hgt hcl ecl pid]

    def extract_fields(input)
      input.scan(FIELD_REGEX)
    end

    def parse_passports(input)
      input.split("\n\n").map { |parseport| extract_fields(parseport) }
    end

    def validate_field_value(field, value)
      case field
      when 'byr'
        value.size == 4 && value.to_i >= 1920 && value.to_i <= 2002
      when 'iyr'
        value.size == 4 && value.to_i >= 2010 && value.to_i <= 2020
      when 'eyr'
        value.size == 4 && value.to_i >= 2020 && value.to_i <= 2030
      when 'hgt'
        number, unit = value[0..-2].to_i, value[-2..value.size]

        return false unless ['cm', 'in'].include? unit
        if unit == 'cm'
          number >= 150 && number <=193
        else
          number >=59 && number <=76
        end
      when 'hcl'
        /#[a-f0-9]{6}/.match?(value)
      when 'ecl'
        %w[amb blu brn gry grn hzl oth].include? value
      when 'pid'
        /^[0-9]{9}$/.match?(value)
      end
    end

    def validate_fields(fields)
      REQUIRED_FIELDS.subset?(Set.new(fields))
    end

    def count_valid_passports(input)
      parse_passports(input).count { |fields|  validate_fields(fields) }
    end

    def count_valid_passports_in_file(filepath)
      expanded_path = File.expand_path(filepath, File.expand_path('..', File.dirname(__FILE__)))
      count_valid_passports(File.read(expanded_path))
    end
  end
end

