# Clear existing data
OrderItem.delete_all
CartItem.delete_all
Order.delete_all
Cart.delete_all
Product.delete_all

puts "Clearing database..."

# Curated Products with Matching Images
products_data = [
  # Phones
  {
    title: "iPhone 15 Pro",
    price: 999.00,
    description: "The first iPhone to feature an aerospace-grade titanium design, using the same alloy that spacecraft use for missions to Mars.",
    category: "phones",
    stock: 50,
    images: [ "https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&q=80&w=800" ],
    slug: "iphone-15-pro"
  },
  {
    title: "Samsung Galaxy S24 Ultra",
    price: 1299.00,
    discounted_price: 1199.00,
    description: "Unleash new levels of creativity, productivity and possibility with Galaxy S24 Ultra. Check out the new flat display, AI features and more.",
    category: "phones",
    stock: 30,
    images: [ "https://images.unsplash.com/photo-1705917835158-75553535955c?auto=format&fit=crop&q=80&w=800" ],
    slug: "samsung-galaxy-s24-ultra"
  },
  {
    title: "Google Pixel 8 Pro",
    price: 999.00,
    description: "The most powerful Pixel yet, with the new Google Tensor G3 chip and pro-level cameras.",
    category: "phones",
    stock: 45,
    images: [ "https://images.unsplash.com/photo-1696446701796-da61225697cc?auto=format&fit=crop&q=80&w=800" ],
    slug: "google-pixel-8-pro"
  },
  {
    title: "OnePlus 12",
    price: 799.00,
    discounted_price: 699.00,
    description: "Flagship performance meets stunning design. Features Snapdragon 8 Gen 3 and a brilliant AMOLED display.",
    category: "phones",
    stock: 35,
    images: [ "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&q=80&w=800" ],
    slug: "oneplus-12"
  },
  {
    title: "Xiaomi 14 Pro",
    price: 899.00,
    description: "Professional photography in your pocket. Leica-engineered cameras and cutting-edge performance.",
    category: "phones",
    stock: 0,
    images: [ "https://images.unsplash.com/photo-1598327105666-5b89351aff97?auto=format&fit=crop&q=80&w=800" ],
    slug: "xiaomi-14-pro"
  },

  # Laptops
  {
    title: "MacBook Pro 16",
    price: 2499.00,
    description: "The most powerful MacBook Pro ever is here. With the blazing-fast M3 Max chip, incredible battery life, and a stunning Liquid Retina XDR display.",
    category: "laptops",
    stock: 20,
    images: [ "https://images.unsplash.com/photo-1517336714731-489689fd1ca4?auto=format&fit=crop&q=80&w=800" ],
    slug: "macbook-pro-16"
  },
  {
    title: "Dell XPS 15",
    price: 1899.00,
    discounted_price: 1699.00,
    description: "Immersive display, powerful performance and high-precision design. The XPS 15 is the perfect balance of power and portability.",
    category: "laptops",
    stock: 25,
    images: [ "https://images.unsplash.com/photo-1593642632823-8f78536788c6?auto=format&fit=crop&q=80&w=800" ],
    slug: "dell-xps-15"
  },
  {
    title: "MacBook Air M3",
    price: 1299.00,
    description: "Supercharged by the M3 chip. Up to 18 hours of battery life. Strikingly thin and light.",
    category: "laptops",
    stock: 40,
    images: [ "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?auto=format&fit=crop&q=80&w=800" ],
    slug: "macbook-air-m3"
  },
  {
    title: "Lenovo ThinkPad X1 Carbon",
    price: 1599.00,
    description: "The ultimate business laptop. Military-grade durability meets premium performance.",
    category: "laptops",
    stock: 18,
    images: [ "https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?auto=format&fit=crop&q=80&w=800" ],
    slug: "lenovo-thinkpad-x1-carbon"
  },
  {
    title: "ASUS ROG Zephyrus G16",
    price: 2199.00,
    discounted_price: 1999.00,
    description: "Gaming powerhouse in a sleek package. RTX 4080 graphics and stunning OLED display.",
    category: "laptops",
    stock: 12,
    images: [ "https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&q=80&w=800" ],
    slug: "asus-rog-zephyrus-g16"
  },

  # Audio
  {
    title: "Sony WH-1000XM5",
    price: 399.00,
    description: "Industry-leading noise canceling with two processors controlling 8 microphones for unprecedented noise cancellation and exceptional call quality.",
    category: "audio",
    stock: 100,
    images: [ "https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&q=80&w=800" ],
    slug: "sony-wh-1000xm5"
  },
  {
    title: "AirPods Max",
    price: 549.00,
    description: "AirPods Max reimagine over-ear headphones. An Apple-designed dynamic driver provides high-fidelity audio.",
    category: "audio",
    stock: 40,
    images: [ "https://images.unsplash.com/photo-1609081219090-a6d81d3085bf?auto=format&fit=crop&q=80&w=800" ],
    slug: "airpods-max"
  },
  {
    title: "Bose QuietComfort Ultra",
    price: 429.00,
    discounted_price: 379.00,
    description: "World-class noise cancellation meets breakthrough spatial audio. Immersive sound for any moment.",
    category: "audio",
    stock: 55,
    images: [ "https://images.unsplash.com/photo-1546435770-a3e426bf472b?auto=format&fit=crop&q=80&w=800" ],
    slug: "bose-quietcomfort-ultra"
  },
  {
    title: "AirPods Pro (2nd Gen)",
    price: 249.00,
    description: "Adaptive Audio. Personalized Spatial Audio. Active Noise Cancellation. All in a magical experience.",
    category: "audio",
    stock: 80,
    images: [ "https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?auto=format&fit=crop&q=80&w=800" ],
    slug: "airpods-pro-2nd-gen"
  },
  {
    title: "Sennheiser Momentum 4",
    price: 379.00,
    description: "Audiophile sound quality with exceptional 60-hour battery life. Premium wireless listening.",
    category: "audio",
    stock: 30,
    images: [ "https://images.unsplash.com/photo-1484704849700-f032a568e944?auto=format&fit=crop&q=80&w=800" ],
    slug: "sennheiser-momentum-4"
  },

  # Wearables
  {
    title: "Apple Watch Ultra 2",
    price: 799.00,
    description: "The most rugged and capable Apple Watch pushes the limits again. Featuring the all-new S9 SiP.",
    category: "wearables",
    stock: 60,
    images: [ "https://images.unsplash.com/photo-1694606161362-f54228956973?auto=format&fit=crop&q=80&w=800" ],
    slug: "apple-watch-ultra-2"
  },
  {
    title: "Samsung Galaxy Watch 6",
    price: 299.00,
    discounted_price: 249.00,
    description: "Start your everyday wellness journey. Galaxy Watch6 features a 20% larger display and a 30% slimmer bezel.",
    category: "wearables",
    stock: 0,
    images: [ "https://images.unsplash.com/photo-1691436848203-d5885c464c12?auto=format&fit=crop&q=80&w=800" ],
    slug: "samsung-galaxy-watch-6"
  },
  {
    title: "Garmin Fenix 7",
    price: 699.00,
    description: "Premium multisport GPS watch with solar charging. Built for athletes and adventurers.",
    category: "wearables",
    stock: 25,
    images: [ "https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?auto=format&fit=crop&q=80&w=800" ],
    slug: "garmin-fenix-7"
  },
  {
    title: "Fitbit Charge 6",
    price: 159.00,
    description: "Advanced fitness tracker with built-in GPS and heart rate monitoring. Your health companion.",
    category: "wearables",
    stock: 90,
    images: [ "https://images.unsplash.com/photo-1575311373937-040b8e1fd5b6?auto=format&fit=crop&q=80&w=800" ],
    slug: "fitbit-charge-6"
  },
  {
    title: "Apple Watch Series 9",
    price: 429.00,
    discounted_price: 379.00,
    description: "Our most powerful chip yet. A magical new way to use your watch. And a brighter display.",
    category: "wearables",
    stock: 70,
    images: [ "https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?auto=format&fit=crop&q=80&w=800" ],
    slug: "apple-watch-series-9"
  }
]

created_products = []
products_data.each do |product_attrs|
  product = Product.create!(product_attrs)
  created_products << product
  puts "Created Product: #{product.title}"
end

# Orders
statuses = [ 'PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED' ]

15.times do
  status = statuses.sample
  created_at = Faker::Time.backward(days: 30)

  order = Order.create!(
    customer_name: Faker::Name.name,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    status: status,
    total_price: 0,
    courier_name: (status == 'SHIPPED' || status == 'DELIVERED') ? [ 'FedEx', 'DHL', 'Blue Dart', 'DTDC' ].sample : nil,
    courier_link: (status == 'SHIPPED' || status == 'DELIVERED') ? 'https://www.fedex.com/track' : nil,
    created_at: created_at,
    updated_at: created_at
  )

  # Add items to order
  total_price = 0
  rand(1..4).times do
    product = created_products.sample
    quantity = rand(1..3)
    price = product.discounted_price || product.price

    OrderItem.create!(
      order: order,
      product: product,
      quantity: quantity,
      price_at_purchase: price
    )
    total_price += price * quantity
  end

  order.update!(total_price: total_price)
  puts "Created Order ##{order.id} - #{status} - #{order.customer_name}"
end

puts "Seeding completed successfully!"
puts "Created #{Product.count} products and #{Order.count} orders"
