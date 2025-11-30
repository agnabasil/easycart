class Admin::OrdersController < Admin::BaseController
  layout "admin"
  before_action :set_order, only: %i[ show update ]

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
  end

  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "Order updated successfully."
    else
      redirect_to admin_order_path(@order), alert: "Failed to update order."
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :tracking_number, :courier_name, :courier_link)
  end
end
