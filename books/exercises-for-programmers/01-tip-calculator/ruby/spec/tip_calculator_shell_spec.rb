require 'spec_helper'
require_relative '../tip_calculator_shell.rb'

describe TipCalculatorShell do
  describe '#prompt_for_bill_amount' do
    let(:bill_msg) { 'What is the bill amount? ' }

    it 'prompts the user for a bill amount' do
      io = { input: mock_io, output: mock_io }
      shell = TipCalculatorShell.new(io)

      shell.prompt_for_bill_amount

      expect(io[:output].string).to eq(bill_msg)
    end

    it 'receives user input from the command prompt' do
      io = { input: mock_io('500'), output: mock_io }
      shell = TipCalculatorShell.new(io)

      shell.prompt_for_bill_amount

      expect(shell.bill).to eq('500')
    end
  end

  describe '#prompt_for_tip_percentage' do
    let(:tip_msg) { 'What is the tip percentage? ' }

    it 'prompts the user for a tip percentage' do
      io = { input: mock_io, output: mock_io }
      shell = TipCalculatorShell.new(io)

      shell.prompt_for_tip_percentage

      expect(io[:output].string).to eq(tip_msg)
    end

    it 'receives user input from the command prompt' do
      io = { input: mock_io('15'), output: mock_io }
      shell = TipCalculatorShell.new(io)

      shell.prompt_for_tip_percentage

      expect(shell.tip).to eq('15')
    end
  end
end
