class PartOne
  FIELD_REGEX = /(\w{3}):/
  REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid]

  def extract_fields(input)
    input.scan(FIELD_REGEX).flatten
  end

  def parse_passports(input)
    input.split("\n\n").map { |parseport| extract_fields(parseport) }
  end

  def validate_fields(fields)
    REQUIRED_FIELDS.all? { |req| fields.include?(req) }
  end
end
