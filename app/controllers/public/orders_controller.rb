class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:d_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:d_address] == "1"
      @address = Address.find(params[:ad_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:d_address] == "2"
    end
    @cart_items = CartItem.all
  end

  def thanks
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
       @order_details = @order.order_details.new
       @order_details.item_id = cart_item.item.id
       @order_details.item.name = cart_item.item.name
       @order_details.purchase_price = cart_item.item.price
       @order_details.amount = cart_item.amount
       @order_details.save
       current_customer.cart_items.destroy_all
     end
    redirect_to orders_thanks_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :delivery_charge, :total_payment, :payment_method, :status)
  end
end
