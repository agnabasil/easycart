module Admin
  class OrderItemsController < Admin::BaseController
    before_action :set_order_item, only: [ :update, :destroy ]
    before_action :set_order, only: [ :create ]

    def create
      if @order.status != "PENDING"
        return redirect_to admin_order_path(@order), alert: "Cannot modify non-pending order."
      end

      product = Product.find(params[:order_item][:product_id])
      quantity = params[:order_item][:quantity].to_i

      # Check if item already exists in order
      existing_item = @order.order_items.find_by(product_id: product.id)

      if existing_item
        existing_item.update(quantity: existing_item.quantity + quantity)
      else
        @order.order_items.create!(
          product: product,
          quantity: quantity,
          price_at_purchase: product.price_to_display
        )
      end

      update_order_total(@order)
      redirect_to admin_order_path(@order), notice: "Item added successfully."
    rescue => e
      redirect_to admin_order_path(@order), alert: "Failed to add item: #{e.message}"
    end

    def update
      order = @order_item.order
      if order.status != "PENDING"
        return redirect_to admin_order_path(order), alert: "Cannot modify non-pending order."
      end

      if @order_item.update(order_item_params)
        update_order_total(order)
        redirect_to admin_order_path(order), notice: "Item updated successfully."
      else
        redirect_to admin_order_path(order), alert: "Failed to update item."
      end
    end

    def destroy
      order = @order_item.order
      if order.status != "PENDING"
        return redirect_to admin_order_path(order), alert: "Cannot modify non-pending order."
      end

      @order_item.destroy
      update_order_total(order)
      redirect_to admin_order_path(order), notice: "Item removed successfully."
    end

    private

    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:order_item][:order_id])
    end

    def order_item_params
      params.require(:order_item).permit(:quantity)
    end

    def update_order_total(order)
      total = order.order_items.sum { |item| item.price_at_purchase * item.quantity }
      order.update(total_price: total)
    end
  end
end
