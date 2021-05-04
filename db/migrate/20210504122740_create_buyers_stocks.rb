class CreateBuyersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.decimal :price
      t.decimal :units
      t.integer :broker_id

      t.timestamps
    end
  end
end
