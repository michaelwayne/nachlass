class TipCalculatorCore
  def initialize(bill_amount:, tip_percent:)
    @bill_amount = bill_amount
    @tip_percent = tip_percent
  end

  def calculated_tip
    formatted_output tip
  end

  def calculated_total
    formatted_output total
  end

  private

  def formatted_output(value)
    format '$%.2f', value
  end

  def tip
    @bill_amount * (@tip_percent / 100)
  end

  def total
    @bill_amount + tip
  end
end
