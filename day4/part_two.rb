require 'set'

module Day4
  class PartTwo
    FIELD_REGEX = /(\w{3}):/
    REQUIRED_FIELDS = Set.new %w[byr iyr eyr hgt hcl ecl pid]

    def extract_fields(input)
      input.scan(FIELD_REGEX).flatten
    end

    def parse_passports(input)
      input.split("\n\n").map { |parseport| extract_fields(parseport) }
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

