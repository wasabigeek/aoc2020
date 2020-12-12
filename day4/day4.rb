class PartOne
  FIELD_REGEX = /(\w{3}):/

  def extract_fields(input)
    input.scan(FIELD_REGEX).flatten
  end
end
