class CartsController < ApplicationController
    def index
    @carts = Cart.all
    @orders = Order.all
    end
    def show
    end
    def add_to_cart
        @product = Product.find_by(id: params[:id])
        if current_user.orders.present?
            @order = current_user.orders
        else
            current_user.orders.create(amount: 10000,date: "12-2-2024",product_id:1)
        end 
       
    
        redirect_to carts_path
      end
    
end
