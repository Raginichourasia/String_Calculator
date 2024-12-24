require 'rails_helper'

require_relative '../calculator'

RSpec.describe Calculator do
  it 'returns 0 for an empty string' do
    expect(MyCalculator.add("")).to eq(0)
  end
end

