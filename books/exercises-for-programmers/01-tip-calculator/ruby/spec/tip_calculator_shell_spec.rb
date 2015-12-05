require_relative 'spec_helper'
require_relative '../tip_calculator_shell.rb'
require_relative '../tip_calculator_core.rb'

describe TipCalculatorShell do
  let(:bill_amount) { @shell.instance_variable_get(:@bill_amount) }
  let(:tip_percent) { @shell.instance_variable_get(:@tip_percent) }
  let(:error_msg) { "Please enter a positive number\n\n" }

  describe '#prompt_for_bill_amount' do
    it 'prompts the user for a bill amount' do
      @io = mock_io(input: '15')
      @shell = TipCalculatorShell.new(@io)

      @shell.prompt_for_bill_amount
      expect(@io[:output].string).to include('What is the bill amount? ')
    end

    context 'when the user enters a valid bill' do
      before do
        @io = mock_io(input: '150')
        @shell = TipCalculatorShell.new(@io)
      end

      it 'attempts to parse user input into a float' do
        @shell.prompt_for_bill_amount
        expect(bill_amount).to eq(150.0)
      end

      it 'does not display the error message' do
        @shell.prompt_for_bill_amount
        expect(@io[:output].string).to_not include(error_msg)
      end
    end

    context 'when the user enters an invalid bill' do
      before do
        @io = mock_io(input: 'bad')
        @shell = TipCalculatorShell.new(@io)
      end

      it 'falls back to 0.0 when parsing input fails' do
        @shell.prompt_for_bill_amount
        expect(bill_amount).to eq(0.0)
      end

      it 'displays the error message' do
        @shell.prompt_for_bill_amount
        expect(@io[:output].string).to include(error_msg)
      end
    end
  end

  describe '#prompt_for_tip_percent' do
    it 'prompts the user for a tip percentage' do
      @io = mock_io(input: '15')
      @shell = TipCalculatorShell.new(@io)

      @shell.prompt_for_tip_percent
      expect(@io[:output].string).to include('What is the tip percentage? ')
    end

    context 'when the user enters a valid tip percent' do
      before do
        @io = mock_io(input: '15')
        @shell = TipCalculatorShell.new(@io)
      end

      it 'stores the tip as a floating point number' do
        @shell.prompt_for_tip_percent
        expect(tip_percent).to eq(15.0)
      end

      it 'does not display the error message' do
        @shell.prompt_for_tip_percent
        expect(@io[:output].string).to_not include(error_msg)
      end
    end

    context 'when the user enters an invalid tip percent' do
      before do
        @io = mock_io(input: 'bad')
        @shell = TipCalculatorShell.new(@io)
      end

      it 'sets the tip value to 0.0' do
        @shell.prompt_for_tip_percent
        expect(tip_percent).to eq(0.0)
      end

      it 'displays the error message' do
        @shell.prompt_for_tip_percent
        expect(@io[:output].string).to include(error_msg)
      end
    end
  end

  describe '#display_tip_and_total' do
    before do
      @io = mock_io
      @shell = TipCalculatorShell.new(@io)
      @core = double
      allow(@core).to receive(:calculated_tip).and_return('$22.50')
      allow(@core).to receive(:calculated_total).and_return('$172.50')
      @shell.display_tip_and_total(@core)
    end

    it 'displays the calculated tip' do
      tip = "Tip: #{@core.calculated_tip}\n"
      expect(@io[:output].string).to include(tip)
    end

    it 'displays the calculated total' do
      total = "Total: #{@core.calculated_total}\n"
      expect(@io[:output].string).to include(total)
    end
  end
end
