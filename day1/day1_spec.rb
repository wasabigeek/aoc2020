require 'rspec'
require_relative './day1.rb'

RSpec.describe 'day1' do
  it 'multiples entries when both add to 2020' do
    input = [
      2019,
      1
    ]
    expect(multiply_matching_entries(input)).to eq(2019)
  end

  it 'multiplies the correct entries when there are others' do
    input = [
      2019,
      2,
      1,
      3
    ]
    expect(multiply_matching_entries(input)).to eq(2019)
  end

  it 'multiplies the correct entries' do
    input = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]
    expect(multiply_matching_entries(input)).to eq(514579)
  end
end