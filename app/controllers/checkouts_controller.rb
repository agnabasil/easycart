class CheckoutsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def new
    if @cart.cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end
    @order = Order.new
  end

  def create
    if @cart.cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    @order = Order.new(order_params)
    @order.total_price = @cart.total_price

    if @order.save
      # Move cart items to order items
      @cart.cart_items.each do |cart_item|
        @order.order_items.create(
          product: cart_item.product,
          quantity: cart_item.quantity,
          price_at_purchase: cart_item.product.price_to_display
        )
      end

      # Construct WhatsApp Message
      message = "New Order Request:\n\n"
      @order.order_items.each do |item|
        message += "- #{item.product.title} (x#{item.quantity}): #{view_context.number_to_currency(item.price_at_purchase * item.quantity)}\n"
      end
      message += "\nTotal: #{view_context.number_to_currency(@order.total_price)}"
      message += "\n\nCustomer: #{@order.customer_name}"
      message += "\nPhone: #{@order.phone}"
      message += "\nAddress: #{@order.address}"
      message += "\nOrder ID: ##{@order.id}"
      message += "\n\nPlease confirm availability and shipping details."

      # Clear Cart
      @cart.destroy
      session[:cart_id] = nil

      # Redirect to WhatsApp
      phone_number = ENV.fetch("ADMIN_PHONE_NUMBER", "917907542340") # Admin Number
      whatsapp_url = "https://wa.me/#{phone_number}?text=#{CGI.escape(message)}"

      redirect_to whatsapp_url, allow_other_host: true
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :phone, :address)
  end
end
