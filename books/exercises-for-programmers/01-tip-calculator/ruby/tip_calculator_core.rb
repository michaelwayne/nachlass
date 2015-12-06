class TipCalculatorCore
  def initialize(bill_amount:, tip_percent:)
    @bill_amount = bill_amount
    @tip_percent = tip_percent
  end

  def results
    { tip: calculated_tip, total: calculated_total }
  end

  private

  def calculated_tip
    formatted_output tip
  end

  def calculated_total
    formatted_output total
  end

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
