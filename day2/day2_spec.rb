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
  end
end
