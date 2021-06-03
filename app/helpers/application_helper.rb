module ApplicationHelper
  def addTax(price)
    tax_included_price = (price * 1.1).round
  end

  def sumprice(price,postprice)
    return addTax(price) + postprice
  end
end
