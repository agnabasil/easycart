class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :phone
      t.text :address
      t.string :tracking_number
      t.string :status
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
