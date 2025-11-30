class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product).order(:created_at)
  end
end
