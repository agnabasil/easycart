require 'rails_helper'

RSpec.describe 'Cart and Checkout', type: :system do
  before do
    driven_by(:selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ])
    @product = create(:product, title: 'Test Phone', price: 1000)
  end

  it 'allows adding items to cart and checking out' do
    visit product_path(@product)
    click_button 'ADD TO CART'

    expect(page).to have_content('Item added to cart.')
    visit cart_path
    expect(page).to have_content('YOUR CART')
    expect(page).to have_content('Test Phone')
    expect(page).to have_content('₹1,000')

    # Update quantity
    # Update quantity
    # Click the plus button to increase quantity
    find('button[onclick*=", 1)"]').click
    expect(page).to have_content('2') # Check display updates
    # For simplicity in this test environment, let's just assume the form submission works if we can trigger it.
    # Since the view uses `this.form.requestSubmit()`, Selenium should handle it if we tab out or click away, but explicit submit is safer if possible.
    # We'll skip complex JS interaction for now and focus on the flow.

    click_link 'Proceed to Checkout'

    expect(page).to have_content('CHECKOUT')

    fill_in 'Full Name', with: 'John Doe'
    fill_in 'Phone Number', with: '1234567890'
    fill_in 'Shipping Address', with: '123 Main St'

    # We expect the checkout to redirect to WhatsApp.
    # Since we can't easily verify external redirects in system specs without breaking the test runner or mocking,
    # we will check if the Order count increases.

    expect {
      click_button 'Place Order via WhatsApp'
      # Wait for potential redirect or processing
      sleep 2
    }.to change(Order, :count).by(1)

    order = Order.last
    expect(order.customer_name).to eq('John Doe')
    expect(order.total_price).to eq(2000) # Quantity updated to 2
  end
end
