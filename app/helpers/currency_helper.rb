module CurrencyHelper
  def currency(amount)
    number_to_currency(amount, unit: "$ ", delimiter: ",")
  end
end
