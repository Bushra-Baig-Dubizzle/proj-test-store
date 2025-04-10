class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new create edit update destroy]


  def index
    @products = Product.where.not(name: [nil, ""])
  end

  def show
    # @product = Product.find(params[:id])
    # Now using before actions
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @product = Product.find(params[:id])
    # Now using before_actions
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      # Strong Parameters: allow only :name to be submitted through forms for security
      # params.expect(product: [ :name ])
      params.require(:product).permit(:name, :description, :featured_image, :inventory_count)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
