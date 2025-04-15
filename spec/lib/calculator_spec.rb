# frozen_string_literal: true

require 'calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum of two comma-separated numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'allows newline as a separator' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end
  end
end
