require_relative 'tip_calculator_core.rb'
require_relative 'tip_calculator_shell.rb'

def main
  shell = TipCalculatorShell.new
  shell.run
end

main
