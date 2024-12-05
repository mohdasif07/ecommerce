class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  def checkout
    @cart = current_user.cart
    @order = current_user.orders.create(status: "pending", total_price: @cart.total_price)
    
    @cart.order_items.each do |order_item|
      @order.order_items.create(product: order_item.product, quantity: order_item.quantity, price_at_purchase: order_item.price_at_time)
    end
    
    @cart.update(status: "completed")
    
    
    redirect_to orders_path
  end
end
