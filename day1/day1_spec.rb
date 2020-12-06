require 'rspec'
require_relative './day1.rb'

RSpec.describe 'day1' do
  it 'runs' do
    input = []
    expect(multiply_matching_entries(input)).to eq(true)
  end
end