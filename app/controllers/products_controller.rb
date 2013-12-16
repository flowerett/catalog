class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.order(:title).page(params[:page]).per_page(10)

    @xml_keys = %w(image title price)
  end

  def upload
    success = Product.upload(params[:file])

    redirect_to products_url, notice: "#{success} XML items uploaded!"
  end

  def show
    @reply = @product.replies.build
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :rating, :price, :inet_price, :image)
    end
end
