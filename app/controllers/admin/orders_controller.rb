class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.delivery_charge = 800
    @order_details = @order.order_details
    @total_price = 0
    @order_details.each do |detail|
      @total_price += detail.purchase_price*detail.amount
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :delivery_charge, :total_payment, :payment_method, :status)
  end
end
