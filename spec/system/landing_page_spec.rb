require 'rails_helper'

RSpec.describe 'Landing Page', type: :system do
  before do
    driven_by(:selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ])
  end

  it 'displays the hero section and featured collections' do
    visit root_path

    expect(page).to have_content('NEXT GEN ELECTRONICS')
    expect(page).to have_content('Discover the latest gadgets and accessories designed for the modern lifestyle')
    expect(page).to have_link('Shop Now', href: products_path)
    expect(page).to have_link('View Offers', href: products_path(category: 'offers'))

    expect(page).to have_content('COLLECTIONS')
    expect(page).to have_content('Smartphones')
    expect(page).to have_content('Laptops')
    expect(page).to have_content('Audio')
    expect(page).to have_content('Wearables')
  end
end
