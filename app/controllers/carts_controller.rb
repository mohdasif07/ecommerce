class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :add_to_cart]
  
    def index
      @carts = Cart.all
     # @cart = current_cart
      @products = Product.all
      @order_items = OrderItem.all
    end
  
    def show
    end
  
    def add_to_cart
      @cart = Cart.find(params[:id])
      @product = Product.find(params[:product_id])
      quantity = params[:quantity].to_i || 1
      @order_item = @cart.order_items.find_by(product: @product)
  
      @order_item.quantity += quantity
      if @order_item.save
        redirect_to cart_path(@cart)
      else
        redirect_to products_path
      end
    end
  
  
    private
  
    def set_cart
      @cart = current_user.cart || current_user.create_cart(status: 'in_progress')
    end
  end
  