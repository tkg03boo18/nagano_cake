class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(update_param)
    redirect_to admin_order_path
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :purchase_price, :amount, :making_status)
  end

  def update_param
    params.require(:order_detail).permit(:making_status)
  end
end
