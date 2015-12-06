class TipCalculatorShell
  def initialize(input: $stdin, output: $stdout)
    @input  = input
    @output = output
    @bill_amount = 0.0
    @tip_percent = 0.0
  end

  def run
    prompt_for_bill_amount until @bill_amount > 0.0
    prompt_for_tip_percent until @tip_percent > 0.0

    core = TipCalculatorCore.new(bill_amount: @bill_amount,
                                 tip_percent: @tip_percent)

    display_tip_and_total core.results
  end

  def prompt_for_bill_amount
    output 'What is the bill amount? '
    @bill_amount = Float(input)
    output error_message if @bill_amount <= 0.0
  rescue
    @bill_amount = 0.0
    output error_message
  end

  def prompt_for_tip_percent
    output 'What is the tip percentage? '
    @tip_percent = Float(input)
    output error_message if @tip_percent <= 0.0
  rescue
    @tip_percent = 0.0
    output error_message
  end

  def display_tip_and_total(results)
    output "Tip: #{results[:tip]}\n"
    output "Total: #{results[:total]}\n"
  end

  private

  def input
    @input.gets.chomp
  end

  def output(message)
    @output.print message
  end

  def error_message
    "Please enter a positive number\n\n"
  end
end
