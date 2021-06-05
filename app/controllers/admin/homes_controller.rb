class Admin::HomesController < ApplicationController
  def top
    if params[:order_sort] == "0"
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders
    else
    @orders = Order.all
    end
  end

end
