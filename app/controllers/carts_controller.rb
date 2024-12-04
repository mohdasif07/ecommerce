class CartsController < ApplicationController
    def index
    @carts = Cart.all
    end
    def show
    end
    def add_to_cart
      
        @product = Product.find(params[:product_id])
        @cart = current_user.cart || current_user.create_cart(status: 'pending')
        @cart_item = @cart.cart_items.find_by(product_id: @product.id)
    
        if @cart_item
          @cart_item.update(quantity: @cart_item.quantity + 1)
        else
          @cart.cart_items.create(product: @product, quantity: 1, price_at_time: @product.price)
        end
    
        redirect_to carts_path
      end
end
