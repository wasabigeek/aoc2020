require 'rspec'
require_relative './day4.rb'

RSpec.describe PartOne do
  describe '#extract_fields' do
    it 'extracts passport fields' do
      input = <<~TXT
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm
      TXT

      expect(described_class.new.extract_fields(input)).to match_array(%w[ecl pid eyr hcl byr iyr cid hgt])
    end
  end
end
