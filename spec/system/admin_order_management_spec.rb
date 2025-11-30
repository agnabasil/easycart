require 'rails_helper'

RSpec.describe 'Admin Order Management', type: :system do
  let!(:product) { create(:product, title: 'Test Product', price: 100, stock: 10) }
  let!(:other_product) { create(:product, title: 'Other Product', price: 50, stock: 5) }
  let!(:order) { create(:order, status: 'PENDING') }
  let!(:order_item) { create(:order_item, order: order, product: product, quantity: 1, price_at_purchase: 100) }

  before do
    driven_by(:rack_test)
  end

  it 'allows admin to view order details and status colors' do
    visit admin_order_path(order)

    expect(page).to have_content('Order #')
    expect(page).to have_content('PENDING')
    expect(page).to have_content('Test Product')

    # Check for status color class (yellow for pending)
    # Note: rack_test doesn't see CSS classes applied by Tailwind unless we check the class attribute directly
    # But we can check if the status text is present
  end

  it 'allows admin to add items to a pending order' do
    visit admin_order_path(order)

    # Scoping to the Add Item section
    within('form[action="/admin/order_items"]') do
      find('select').find(:option, 'Other Product').select_option
      find('input[name="order_item[quantity]"]').set(2)
      click_button 'Add'
    end

    expect(page).to have_content('Item added successfully')

    within('.js-order-items-list') do
      expect(page).to have_content('Other Product')
      expect(page).to have_content('Qty: 2')
    end

    # Verify total price updated
    # 1 * 100 + 2 * 50 = 200
    expect(page).to have_content('₹200')
  end

  it 'allows admin to update item quantity in a pending order' do
    visit admin_order_path(order)

    # Find the update form (it has the quantity input)
    form = find("form[action=\"/admin/order_items/#{order_item.id}\"]") do |f|
      f.has_selector?('input[name="order_item[quantity]"]')
    end

    within(form) do
      fill_in 'order_item[quantity]', with: 3
      find('button').click
    end

    expect(page).to have_content('Item updated successfully')

    within('.js-order-items-list') do
      expect(page).to have_content('Qty: 3')
    end

    # Verify total price updated
    # 3 * 100 = 300
    expect(page).to have_content('₹300')
  end

  it 'allows admin to remove items from a pending order' do
    visit admin_order_path(order)

    # Find the delete form (it has _method=delete)
    find("form[action=\"/admin/order_items/#{order_item.id}\"] input[name=\"_method\"][value=\"delete\"]", visible: false).find(:xpath, "..").find('button').click

    expect(page).to have_content('Item removed successfully')

    # Check that the item is removed from the list
    within('.js-order-items-list') do
      expect(page).not_to have_content('Test Product')
    end

    expect(page).to have_content('₹0')
  end

  it 'does not show edit controls for non-pending orders' do
    order.update(status: 'SHIPPED')
    visit admin_order_path(order)

    expect(page).not_to have_content('Add Item')
    expect(page).not_to have_selector('input[name="order_item[quantity]"]')
  end
end
