class OrdersController < ApplicationController
  before_action :set_cart, only: [:create]

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    @order = current_user.orders(order_params)
    if @order.save
      @cart.cart_items.each do |cart_item|
        @order.order_items.create(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.product.price)
      end

      @cart.cart_items.destroy_all

      redirect_to @order, notice: "Your order has been placed successfully."
    else
      redirect_to carts_checkout_path, alert: "There was an error creating your order."
    end
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def order_params
    params.require(:order).permit(:shipping_address,:user_id, :product_id)
  end
end
