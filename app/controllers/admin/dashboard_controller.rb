class Admin::DashboardController < Admin::BaseController
  layout "admin"

  def index
    @total_sales = Order.sum(:total_price)
    @total_orders = Order.count
    @total_products = Product.count
    @recent_orders = Order.order(created_at: :desc).limit(5)
  end
end
