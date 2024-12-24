require 'rails_helper'

require_relative '../calculator'

RSpec.describe Calculator do
  it 'returns 0 for an empty string' do
    expect(MyCalculator.add("")).to eq(0)
  end

  it 'returns the number itself for a single number string' do
    expect(MyCalculator.add("1")).to eq(1)
  end
end

