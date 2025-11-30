class TracksController < ApplicationController
  def index
    if params[:tracking_number].present?
      @order = Order.find_by(tracking_number: params[:tracking_number])
      if @order.nil?
        flash.now[:alert] = "Order not found with tracking number: #{params[:tracking_number]}"
      end
    end
  end
end
