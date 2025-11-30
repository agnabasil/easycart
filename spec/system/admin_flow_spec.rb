require 'rails_helper'

RSpec.describe 'Admin Flow', type: :system do
  before do
    driven_by(:selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ])
    create_list(:order, 5)
    create_list(:product, 3)
  end

  it 'displays dashboard stats' do
    visit admin_dashboard_index_path

    expect(page).to have_content('Dashboard')
    expect(page).to have_content('Total Orders')
    expect(page).to have_content('5')
    expect(page).to have_content('Total Products')
    expect(page).to have_content('3')
  end

  it 'allows creating a product' do
    visit admin_products_path
    click_link 'Add Product'

    fill_in 'Title', with: 'New Admin Product'
    fill_in 'Slug', with: 'new-admin-product'
    fill_in 'Price', with: '500'
    fill_in 'Stock', with: '10'
    select 'phones', from: 'Category'

    click_button 'Create Product'

    expect(page).to have_content('Product created successfully.')
    expect(page).to have_content('New Admin Product')
  end

  it 'allows updating order status' do
    order = Order.first
    visit admin_order_path(order)

    select 'SHIPPED', from: 'Status'
    fill_in 'Tracking number', with: 'TRACK-999'
    click_button 'Update Order'

    expect(page).to have_content('Order updated successfully.')
    expect(page).to have_content('SHIPPED')
    expect(order.reload.status).to eq('SHIPPED')
    expect(order.tracking_number).to eq('TRACK-999')
  end
end
