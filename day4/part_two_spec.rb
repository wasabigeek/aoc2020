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

  describe '#validate_fields' do
    it 'returns false if there are missing fields' do
      fields = [
        ['ecl', 'gry']
      ]

      expect(described_class.new.validate_fields(fields)).to eq(false)
    end

    it 'returns true if all fields are present' do
      fields = [
        ['ecl', 'gry'],
        ['pid', '860033327'],
        ['eyr', '2020'],
        ['hcl', '#fffffd'],
        ['byr', '1937'],
        ['iyr', '2017'],
        ['cid', '147'],
        ['hgt', '183cm']
      ]

      expect(described_class.new.validate_fields(fields)).to eq(true)
    end

    it 'returns true if all fields except cid are present' do
      fields = [
        ['ecl', 'gry'],
        ['pid', '860033327'],
        ['eyr', '2020'],
        ['hcl', '#fffffd'],
        ['byr', '1937'],
        ['iyr', '2017'],
        ['hgt', '183cm']
      ]

      expect(described_class.new.validate_fields(fields)).to eq(true)
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

    context 'with eyr data' do
      let(:field) { 'eyr' }
      it 'returns true if valid' do
        value = '2020'
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

      it 'returns false if <2020' do
        value = '2019'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if >2030' do
        value = '2031'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end
    end

    context 'with hgt data' do
      let(:field) { 'hgt' }
      it 'returns true if valid inches' do
        value = '60in'
        expect(described_class.new.validate_field_value(field, value)).to eq(true)
      end

      it 'returns true if valid cm' do
        value = '190cm'
        expect(described_class.new.validate_field_value(field, value)).to eq(true)
      end

      it 'returns false if no unit given' do
        value = '190'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if invalid number' do
        value = 'abcm'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if cm and height <150' do
        value = '149cm'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if cm and height >193' do
        value = '194cm'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if inches and height <59' do
        value = '58in'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if inches and height >76' do
        value = '77in'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns true if inches and valid height' do
        value = '59in'
        expect(described_class.new.validate_field_value(field, value)).to eq(true)
      end
    end

    context 'with hcl data' do
      let(:field) { 'hcl' }
      it 'returns true if valid' do
        value = '#123abc'
        expect(described_class.new.validate_field_value(field, value)).to eq(true)
      end

      it 'returns false if missing #' do
        value = '123abc'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if <6 characters after #' do
        value = '#123ab'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false if characters after # are after the letter f' do
        value = '#123abz'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end

      it 'returns false characters after # are not alphanumeric' do
        value = '#123.ab'
        expect(described_class.new.validate_field_value(field, value)).to eq(false)
      end
    end

    context 'with ecl data' do
      let(:field) { 'ecl' }
      it 'returns true if valid' do
        validations = %w[amb blu brn gry grn hzl oth].map do |value|
          described_class.new.validate_field_value(field, value)
        end
        expect(validations.all?).to eq true
      end

      it 'returns false if invalid' do
        value = 'wat'
        expect(described_class.new.validate_field_value(field, value)).to eq false
      end
    end

    context 'with pid data' do
      let(:field) { 'pid' }

      it 'returns true if 9 digits' do
        value = '000000001'
        expect(described_class.new.validate_field_value(field, value)).to eq true
      end

      it 'returns false if >9 digits' do
        value = '0123456789'
        expect(described_class.new.validate_field_value(field, value)).to eq false
      end

      it 'returns false if <9 digits' do
        value = '01234567'
        expect(described_class.new.validate_field_value(field, value)).to eq false
      end

      it 'returns false if non-digits' do
        value = '0123c5678'
        expect(described_class.new.validate_field_value(field, value)).to eq false
      end
    end

    context 'with cid data' do
      let(:field) { 'cid' }
      it 'returns true' do
        value = '0123c5678'
        expect(described_class.new.validate_field_value(field, value)).to eq true
      end
    end
  end

  describe '#count_valid_passports' do
    it 'counts invalid passports correctly' do
      input = <<~TXT
      eyr:1972 cid:100
      hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

      iyr:2019
      hcl:#602927 eyr:1967 hgt:170cm
      ecl:grn pid:012533040 byr:1946

      hcl:dab227 iyr:2012
      ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

      hgt:59cm ecl:zzz
      eyr:2038 hcl:74454a iyr:2023
      pid:3556412378 byr:2007
      TXT

      expect(described_class.new.count_valid_passports(input)).to eq(0)
    end

    it 'counts valid passports correctly' do
      input = <<~TXT
        pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
        hcl:#623a2f

        eyr:2029 ecl:blu cid:129 byr:1989
        iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

        hcl:#888785
        hgt:164cm byr:2001 iyr:2015 cid:88
        pid:545766238 ecl:hzl
        eyr:2022

        iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
      TXT

      expect(described_class.new.count_valid_passports(input)).to eq(4)
    end
  end
end
