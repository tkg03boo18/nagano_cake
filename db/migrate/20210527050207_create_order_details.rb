class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :purchase_price
      t.integer :amount
      t.integer :making_status, dafault: 0

      t.timestamps
    end
  end
end
