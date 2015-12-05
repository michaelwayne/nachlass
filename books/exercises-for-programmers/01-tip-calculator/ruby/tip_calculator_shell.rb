class TipCalculatorShell
  def initialize(input: $stdin, output: $stdout)
    @input  = input
    @output = output
    @bill = 0.0
    @tip  = 0.0
  end

  attr_reader :bill, :tip

  def prompt_for_bill_amount
    output 'What is the bill amount? '
    @bill = input
  end

  def prompt_for_tip_percentage
    output 'What is the tip percentage? '
    @tip = input
  end

  private

  def output(message)
    @output.print message
  end

  def input
    @input.gets.chomp
  end
end
