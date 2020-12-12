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
    it 'returns fields and values for each passport' do
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
        [
          ["ecl", "gry"], ["pid", "860033327"], ["eyr", "2020"], ["hcl", "#fffffd"], ["byr", "1937"], ["iyr", "2017"], ["cid", "147"], ["hgt", "183cm"]
        ],
        [
          ["iyr", "2013"], ["ecl", "amb"], ["cid", "350"], ["eyr", "2023"], ["pid", "028048884"], ["hcl", "#cfa07d"], ["byr", "1929"]
        ],
        [
          ["hcl", "#ae17e1"], ["iyr", "2013"], ["eyr", "2024"], ["ecl", "brn"], ["pid", "760753108"], ["byr", "1931"], ["hgt", "179cm"]
        ],
        [
          ["hcl", "#cfa07d"], ["eyr", "2025"], ["pid", "166559648"], ["iyr", "2011"], ["ecl", "brn"], ["hgt", "59in"]
        ]
      ])
    end
  end

  describe '#validate_field_value' do
    context 'with byr data' do
      let(:field) { 'byr' }
      it 'returns true if valid' do
        value = '2002'
        expect(described_class.new.validate_field_value(field, value)).to eq(true)
      end

      it 'returns false if < 4 digits' do
        value = '200'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if > 4 digits' do
        value = '20022'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if <1920' do
        value = '1919'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if >2002' do
        value = '2003'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end
    end

    context 'with iyr data' do
      let(:field) { 'iyr' }
      it 'returns true if valid' do
        value = '2010'
        expect(described_class.new.validate_field_value(field, value)).to eq(true)
      end

      it 'returns false if < 4 digits' do
        value = '200'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if > 4 digits' do
        value = '20022'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if <2010' do
        value = '2009'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if >2020' do
        value = '2021'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end
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
