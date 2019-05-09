class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    #binding.pry
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    inv = !!product.inventory ? "true" : "false"
    render plain: inv
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end #end of controller
