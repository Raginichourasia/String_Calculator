require 'rails_helper'

require_relative '../calculator'

RSpec.describe MyCalculator do
  describe '.add' do
    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(MyCalculator.add("")).to eq(0)
      end
    end

    context 'when the input contains only spaces' do
      it 'returns 0' do
        expect(MyCalculator.add("   ")).to eq(0)
      end
    end

    context 'when the input is a single number' do
      it 'returns the number itself' do
        expect(MyCalculator.add("1")).to eq(1)
      end
    end

    context 'when the input contains two numbers' do
      it 'returns their sum' do
        expect(MyCalculator.add("1,2")).to eq(3)
      end
    end

    context 'when the input contains multiple numbers' do
      it 'returns their sum' do
        expect(MyCalculator.add("1,2,3,4")).to eq(10)
      end
    end

    context 'when the input contains newlines as delimiters' do
      it 'handles newlines as valid delimiters and returns the sum' do
        expect(MyCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when the input contains custom delimiters' do
      it 'handles custom delimiters and returns the sum' do
        expect(MyCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when the input contains multiple custom delimiters' do
      it 'handles multiple custom delimiters and returns the sum' do
        expect(MyCalculator.add("//[;][#]\n1;2#3")).to eq(6)
      end
    end

    context 'when the input contains multiple delimiters (comma, newline, custom)' do
      it 'correctly parses and returns the sum' do
        expect(MyCalculator.add("//[;][#]\n1;2\n3#4")).to eq(10)
      end
    end

    context 'when the input contains both delimiters and newline characters' do
      it 'correctly handles both and returns the sum' do
        expect(MyCalculator.add("//;\n1;2\n3")).to eq(6)
      end
    end

    context 'when the input contains multiple spaces between numbers' do
      it 'ignores extra spaces and returns the correct sum' do
        expect(MyCalculator.add("1   ,  2   , 3")).to eq(6)
      end
    end

    context 'when the input contains negative numbers' do
      it 'throws an exception with negative numbers in the input' do
        expect { MyCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
      end
    end

    context 'when the input contains multiple negative numbers' do
      it 'throws an exception with all negative numbers' do
        expect { MyCalculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
      end
    end

    context 'when the input contains more than one negative number' do
      it 'throws an exception with all negative numbers' do
        expect { MyCalculator.add("-1,-2,-3,-4") }.to raise_error("negative numbers not allowed: -1, -2, -3, -4")
      end
    end

    context 'when the input contains numbers exceeding 10000' do
      it 'ignores numbers exceeding 10000' do
        expect(MyCalculator.add("2,10001,3")).to eq(5)   
        expect(MyCalculator.add("10000,10001,9999")).to eq(19999)  
      end
    end

    context 'when the input contains only delimiters and no numbers' do
      it 'returns 0' do
        expect(MyCalculator.add("//;\n")).to eq(0)
      end
    end

    context 'when the input contains invalid non-numeric characters' do
      it 'raises an error for invalid numbers' do
        expect { MyCalculator.add("1,abc,3") }.to raise_error("invalid number: abc")
      end
    end
  end
end
