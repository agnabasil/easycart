class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :slug
      t.decimal :price, precision: 10, scale: 2
      t.decimal :discounted_price, precision: 10, scale: 2
      t.text :description
      t.string :category
      t.integer :stock
      t.json :images

      t.timestamps
    end
  end
end
