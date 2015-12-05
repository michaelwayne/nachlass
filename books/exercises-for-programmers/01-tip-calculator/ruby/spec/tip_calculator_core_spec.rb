require_relative 'spec_helper'
require_relative '../tip_calculator_core.rb'

describe TipCalculatorCore do
  describe '#calculated_tip' do
    it 'returns the dollar amount of the tip' do
      @core = TipCalculatorCore.new(bill_amount: 150.0, tip_percent: 15.0)
      expect(@core.calculated_tip).to eq('$22.50')
    end
  end

  describe '#calculated_total' do
    it 'returns the dollar amount of the total' do
      @core = TipCalculatorCore.new(bill_amount: 150.0, tip_percent: 15.0)
      expect(@core.calculated_total).to eq('$172.50')
    end
  end
end
