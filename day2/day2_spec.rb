require 'rspec'
require_relative './day2.rb'

RSpec.describe PartOne do
  describe '#check_password' do
    it 'handles the min case' do
      input = '1-3 a: abcde'
      # 1-3 b: cdefg
      # 2-9 c: ccccccccc'
      expect(PartOne.check_password(input)).to eq(true)
    end
  end
end
