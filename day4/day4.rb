class PartOne
  FIELD_REGEX = /(\w{3}):/

  def extract_fields(input)
    input.scan(FIELD_REGEX).flatten
  end

  def parse_passports(input)
    input.split("\n\n").map { |parseport| extract_fields(parseport) }
  end
end
