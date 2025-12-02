module ApplicationHelper
  def product_image_url(product)
    if product.images.present? && product.images.any?
      product.images.first
    else
      asset_path("placeholder.svg")
    end
  end

  def format_price(amount)
    number_to_currency(amount)
  end
end
