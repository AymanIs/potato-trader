class CreatePotatoPrices < ActiveRecord::Migration[8.0]
  def change
    create_table :potato_prices do |t|
      t.decimal :price, precision: 10, scale: 2, null: false
      t.datetime :recorded_at, null: false

      t.timestamps
    end
    add_index :potato_prices, :recorded_at
  end
end