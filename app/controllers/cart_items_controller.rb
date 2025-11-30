class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_by(product_id: product.id)

    if @cart_item
      @cart_item.quantity += params[:quantity].to_i
    else
      @cart_item = @cart.cart_items.build(product: product, quantity: params[:quantity].to_i)
    end

    if @cart_item.save
      redirect_to products_path, notice: "Item added to cart."
    else
      redirect_to product_path(product), alert: "Failed to add item to cart."
    end
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update(quantity: params[:quantity].to_i)
      redirect_to cart_path, notice: "Cart updated."
    else
      redirect_to cart_path, alert: "Failed to update cart."
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: "Item removed from cart."
  end
end
