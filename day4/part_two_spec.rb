require 'rspec'
require_relative './part_two.rb'

RSpec.describe Day4::PartTwo do
  describe '#extract_fields' do
    it 'extracts passport fields' do
      input = <<~TXT
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm
      TXT

      expect(described_class.new.extract_fields(input)).to include(
        ['ecl', 'gry'],
        ['pid', '860033327'],
        ['eyr', '2020'],
        ['hcl', '#fffffd'],
        ['byr', '1937'],
        ['iyr', '2017'],
        ['cid', '147'],
        ['hgt', '183cm']
      )
    end
  end

  describe '#parse_passports' do
    it 'returns fields for each passport' do
      input = <<~TXT
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm

        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929

        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm

        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
      TXT

      expect(described_class.new.parse_passports(input)).to eq([
        %w[ecl pid eyr hcl byr iyr cid hgt],
        %w[iyr ecl cid eyr pid hcl byr],
        %w[hcl iyr eyr ecl pid byr hgt],
        %w[hcl eyr pid iyr ecl hgt]
      ])
    end
  end

  describe '#validate_fields' do
    it 'returns false if there are missing fields' do
      fields = %w[hcl eyr pid iyr ecl hgt]

      expect(described_class.new.validate_fields(fields)).to eq(false)
    end

    it 'returns true if all fields are present' do
      fields = %w[byr iyr eyr hgt hcl ecl pid cid]

      expect(described_class.new.validate_fields(fields)).to eq(true)
    end

    it 'returns true if all fields except cid are present' do
      fields = %w[byr iyr eyr hgt hcl ecl pid]

      expect(described_class.new.validate_fields(fields)).to eq(true)
    end
  end

  describe '#count_valid_passports' do
    it 'returns the correct count' do
      input = <<~TXT
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm

        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929

        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm

        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
      TXT

      expect(described_class.new.count_valid_passports(input)).to eq(2)
    end
  end

  describe '#count_valid_passports_in_file' do
    it 'returns the correct count' do
      expect(described_class.new.count_valid_passports_in_file('day4/example.txt')).to eq(2)
    end
  end
end
