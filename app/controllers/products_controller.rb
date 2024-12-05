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
  private
  def set_product
    @product = Product.find_by(id: params[:id])
  end
  def product_params
    params.require(:product).permit(:name,:price,:description)
  end
end
