# EasyCart - Modern E-Commerce Platform

A sleek, high-performance e-commerce platform built with Ruby on Rails 8, featuring a stunning dark-themed UI and WhatsApp-based checkout.

![EasyCart](https://img.shields.io/badge/Rails-8.0-red?logo=ruby-on-rails)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue?logo=postgresql)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-Styling-38bdf8?logo=tailwindcss)

## 🌟 Features

### Public-Facing Store
- **Modern UI/UX**: Dark-themed, responsive design with glassmorphism effects
- **Product Catalog**: Browse products across multiple categories (Phones, Laptops, Audio, Wearables)
- **Smart Filtering**: Sort by newest, price (low to high, high to low)
- **Shopping Cart**: Custom quantity selectors with real-time updates
- **Order Tracking**: Track orders using tracking number
- **WhatsApp Checkout**: Seamless order placement via WhatsApp integration

### Admin Portal
- **Secure Access**: HTTP Basic Authentication (Username: `admin`, Password: `password`)
- **Dashboard**: Overview of total sales, products, and orders
- **Product Management**: Full CRUD operations with live image previews
- **Order Management**: 
  - View all orders with status filtering
  - Update order status and tracking details
  - Add/remove/edit items for pending orders
  - Courier partner integration
- **Real-time Updates**: Automatic total price calculations

## 🚀 Tech Stack

- **Backend**: Ruby on Rails 8.0
- **Database**: PostgreSQL
- **Frontend**: 
  - TailwindCSS for styling
  - Turbo for SPA-like experience
  - Vanilla JavaScript for interactions
- **Authentication**: HTTP Basic Auth for admin
- **Integration**: WhatsApp Business API for checkout

## 📋 Prerequisites

- Ruby 3.x
- PostgreSQL
- Node.js (for asset compilation)

## 🛠️ Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd easycart_rails
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed
   ```

4. **Start the server**
   ```bash
   bin/dev
   ```

5. **Access the application**
   - Public Store: http://localhost:3000
   - Admin Portal: http://localhost:3000/admin

## 📱 Product Workflow

### Customer Journey

1. **Browse Products**
   - Visit the home page
   - Click "Shop Now" or navigate to Collections
   - Filter products by category or sort by price/date

2. **Add to Cart**
   - Click "Add to Cart" on any product
   - Adjust quantities using +/- buttons in cart
   - View real-time price updates

3. **Checkout**
   - Click "Proceed to Checkout"
   - Fill in customer details (Name, Phone, Address)
   - Click "Place Order via WhatsApp"
   - Confirm order details on WhatsApp

4. **Track Order**
   - Navigate to "Track Order"
   - Enter tracking number (e.g., EC-12345678)
   - View order status and courier details

### Admin Workflow

1. **Login to Admin Portal**
   - Navigate to `/admin`
   - Enter credentials (admin/password)

2. **Manage Products**
   - View all products in the Products section
   - Create new products with:
     - Title, slug, description
     - Price and discounted price
     - Category and stock levels
     - Image URLs (with live preview)
   - Edit or delete existing products

3. **Manage Orders**
   - View all orders with status indicators
   - Click on an order to view details
   - Update order status (PENDING → SHIPPED → DELIVERED)
   - Add tracking number and courier details
   - For pending orders:
     - Add new items from product dropdown
     - Update item quantities
     - Remove items
   - View automatic total price recalculation

4. **Dashboard Overview**
   - Monitor total sales
   - Track product inventory
   - View recent orders

## 🎨 Design Features

- **Responsive Design**: Mobile-first approach with breakpoints for tablet and desktop
- **Custom Components**:
  - Quantity selectors with +/- buttons
  - Custom styled dropdowns
  - Toast notifications with icons
  - Status badges with color coding
- **Accessibility**: Proper form labels, ARIA attributes, keyboard navigation
- **Performance**: Optimized queries, eager loading, minimal JavaScript

## 📊 Database Schema

### Products
- Title, slug, description
- Price, discounted_price
- Category (phones, laptops, audio, wearables)
- Stock quantity
- Image URLs (JSON array)

### Orders
- Customer details (name, phone, address)
- Status (PENDING, SHIPPED, DELIVERED, CANCELLED)
- Tracking number
- Courier name and link
- Total price

### Order Items
- Product reference
- Quantity
- Price at purchase (for historical accuracy)

### Carts & Cart Items
- Session-based shopping cart
- Temporary storage before checkout

## 🔐 Security

- Admin portal protected with HTTP Basic Authentication
- CSRF protection enabled
- SQL injection prevention via ActiveRecord
- XSS protection with Rails sanitization

## 🌐 API Integration

### WhatsApp Checkout
Orders are sent to WhatsApp with formatted message including:
- Product details with quantities and prices
- Customer information
- Order ID and total amount
- Request for confirmation

## 📝 Sample Data

The application comes with pre-seeded data:
- 20 curated products across 4 categories
- 15 sample orders with various statuses
- Realistic product images from Unsplash
- Courier details for shipped/delivered orders

## 🎯 Key Highlights for Demo

1. **Modern UI**: Showcase the dark theme, smooth animations, and responsive design
2. **Admin Features**: Demonstrate order management, especially adding/editing items
3. **WhatsApp Integration**: Show the seamless checkout flow
4. **Real-time Updates**: Highlight automatic price calculations and live previews
5. **Order Tracking**: Display the public tracking interface
6. **Courier Integration**: Show how courier details are managed and displayed

## 🚧 Future Enhancements

- User authentication for customers
- Payment gateway integration
- Email notifications
- Advanced analytics dashboard
- Product reviews and ratings
- Wishlist functionality
- Multi-currency support

## 📄 License

This project is proprietary and confidential.

## 👥 Contact

For questions or support, please contact the development team.

---

**Built with ❤️ using Ruby on Rails**
