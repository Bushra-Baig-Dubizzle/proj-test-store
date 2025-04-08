class ProductsController < ApplicationController
  def index
    @products = Product.where.not(name: [nil, ""])
  end

  def show
    @product = Product.find(params[:id])
  end
end
