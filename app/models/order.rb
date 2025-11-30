class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates :customer_name, presence: true
  validates :phone, presence: true
  validates :total_price, presence: true

  before_create :generate_tracking_number
  before_create :set_default_status

  private

  def generate_tracking_number
    self.tracking_number = "EC-#{SecureRandom.hex(4).upcase}"
  end

  def set_default_status
    self.status ||= "PENDING"
  end
end
