module ApplicationHelper
  def addTax(price)
    tax_included_price = (price * 1.1).round
  end
end
