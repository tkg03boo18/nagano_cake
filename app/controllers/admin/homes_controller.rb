class Admin::HomesController < ApplicationController
  def top
    if params[:order_sort] == "0"
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page]).per(10)
    else
    @orders = Order.all.page(params[:page]).per(10)
    end
  end

end
