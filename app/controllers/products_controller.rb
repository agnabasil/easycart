class ProductsController < ApplicationController
  def index
    @products = Product.all

    # Filtering
    if params[:category].present?
      if params[:category] == "offers"
        @products = @products.where.not(discounted_price: nil)
      else
        @products = @products.where(category: params[:category])
      end
    end

    # Sorting
    case params[:sort]
    when "price_asc"
      @products = @products.order(price: :asc)
    when "price_desc"
      @products = @products.order(price: :desc)
    else
      @products = @products.order(created_at: :desc)
    end

    @categories = Product.distinct.pluck(:category)
  end

  def show
    @product = Product.find(params[:id])
  end
end
