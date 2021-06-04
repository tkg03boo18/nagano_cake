class Admin::HomesController < ApplicationController
  def top
    # case params[:order_sort]
    # when "0"
      # @customer = Customer.find(params[:customer_id])
      # @orders = @customer.orders
    # else
    @orders = Order.all
    # end
  end

end
