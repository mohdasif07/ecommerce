class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  def checkout
    @cart = current_user.cart
    @order = current_user.orders.create(status: "pending", total_price: @cart.total_price)
    
    # Create order items from the cart items
    @cart.cart_items.each do |cart_item|
      @order.order_items.create(product: cart_item.product, quantity: cart_item.quantity, price_at_purchase: cart_item.price_at_time)
    end
    
    # Update cart status to completed (or delete it if you don't want to keep the cart)
    @cart.update(status: "completed")
    
    # Handle payment logic here (e.g., Stripe)
    
    redirect_to orders_path
  end
end
