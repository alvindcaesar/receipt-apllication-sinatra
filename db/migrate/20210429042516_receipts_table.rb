class ReceiptsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t|
      t.integer :quantity
      t.string :item
      t.decimal :item_price
      t.decimal :total_price
      t.timestamps
    end
  end
end
