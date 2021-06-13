class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "製作中"
      @order.update(status: "製作中")
    elsif
      @order_details.count == OrderDetail.where(order_id: @order.id, making_status: "製作完了").count
      @order.update(status: "発送準備中")
    end
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end


end
