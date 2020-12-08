require 'rspec'
require_relative './day2.rb'

RSpec.describe PartOne do
  describe '#check_password' do
    it 'returns true if min bound of policy is hit' do
      input = '1-3 a: abcde'
      expect(PartOne.new.check_password(input)).to eq(true)
    end

    it 'returns false if policy character is not present' do
      input = '1-3 b: cdefg'
      expect(PartOne.new.check_password(input)).to eq(false)
    end

    it 'returns true if max bound of policy is hit' do
      input = '2-9 c: ccccccccc'
      expect(PartOne.new.check_password(input)).to eq(true)
    end

    it 'works if bounds are double digit' do
      input = '2-19 c: ccccccccc'
      expect(PartOne.new.check_password(input)).to eq(true)
    end
  end

  describe '#check_passwords_in_file' do
    it 'returns count of valid passwords' do
      expect(PartOne.new.check_passwords_in_file('day2/example.txt')).to eq(2)
    end
  end
end

RSpec.describe PartTwo do
  describe '#check_password' do
    it 'returns true if only first position matches the defined character' do
      input = '1-3 a: abcde'
      expect(PartTwo.new.check_password(input)).to eq(true)
    end

    it 'returns false if neither position matches the defined character' do
      input = '1-3 b: cdefg'
      expect(PartTwo.new.check_password(input)).to eq(false)
    end

    it 'returns false if both positions match the defined' do
      input = '2-9 c: ccccccccc'
      expect(PartTwo.new.check_password(input)).to eq(false)
    end
  end

  describe '#check_passwords_in_file' do
    it 'returns count of valid passwords' do
      expect(PartOne.new.check_passwords_in_file('day2/example.txt')).to eq(1)
    end
  end
end
