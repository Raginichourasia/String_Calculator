require 'rails_helper'

require_relative '../calculator'

RSpec.describe Calculator do
  it 'returns 0 for an empty string' do
    expect(MyCalculator.add("")).to eq(0)
  end

  it 'returns the number itself for a single number string' do
    expect(MyCalculator.add("1")).to eq(1)
  end

  it 'returns the sum of two numbers' do
    expect(MyCalculator.add("1,2")).to eq(3)
  end

  it 'returns the sum of multiple numbers' do
    expect(MyCalculator.add("1,2,3,4")).to eq(10)
  end
end

