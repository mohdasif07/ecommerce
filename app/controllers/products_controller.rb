class ProductsController < ApplicationController
  before_action :set_product, only: %w(show edit update destroy)

  def index
    @products = Product.all
  end

  def show 
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save 
     redirect_to products_path
    else
     render :new
    end
  end

  def edit
  end

  def update 
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    @cart.add_product(product, quantity)

    redirect_to products_path, notice: "#{product.name} added to your cart!"
  end
  private
  def set_product
    @product = Product.find_by(id: params[:id])
  end
  def product_params
    params.require(:product).permit(:name,:price,:description,:cart_id)
  end
end
