require 'rails_helper'

RSpec.describe 'Order Tracking', type: :system do
  before do
    driven_by(:selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ])
    @order = create(:order, status: 'SHIPPED')
    # Ensure tracking number is generated
    @order.reload
  end

  it 'allows tracking an order' do
    visit track_path

    fill_in 'tracking_number', with: @order.tracking_number
    click_button 'Track Order'

    expect(page).to have_content('Shipped')
    expect(page).to have_content('Order Confirmed')
    expect(page).to have_content('Your order is on the way.')
  end

  it 'shows error for invalid tracking number' do
    visit track_path

    fill_in 'tracking_number', with: 'INVALID-123'
    click_button 'Track Order'

    expect(page).to have_content('Order not found')
  end
end
