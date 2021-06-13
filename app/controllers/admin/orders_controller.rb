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
    if @order.status == "入金確認"
      @order.order_details.each do |detail|
        detail.update(making_status: "製作待ち")
      end
    end
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
