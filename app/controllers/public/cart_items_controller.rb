class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price*cart_item.amount
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    # @cart_item.update(cart_item_params)
    @cart_item.update(update_param)
    # @cart_item.update(amount: params[:cart_item][:amount])
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    cart_item = current_customer.cart_items.where(item_id: @cart_item.item_id)
    if cart_item.exists?
      cart_item.update(amount: cart_item.first.amount+@cart_item.amount)
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end
    
    def update_param
      params.require(:cart_item).permit(:amount)
    end
end
