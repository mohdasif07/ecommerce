class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add_to_cart, :remove_from_cart]

  def show
    @cart= current_cart
    @cart_items = @cart.cart_items
  end

  def add_to_cart
    current_cart.add_item(params[:product_id])
    redirect_to carts_path(current_cart.id)
  end

   def remove_from_cart
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])
    @item.destroy
    redirect_to carts_path(@cart), notice: "Item removed from cart."
  end
   def checkout
    @cart= current_cart
    @cart_items = @cart.cart_items
   end
   
  private
  def set_cart
    @cart = current_cart 
  end
    def current_cart
    @current_cart ||= current_user.cart || Cart.create(user: current_user)
  end
end