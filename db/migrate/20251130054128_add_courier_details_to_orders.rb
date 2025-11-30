class AddCourierDetailsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :courier_name, :string
    add_column :orders, :courier_link, :string
  end
end
