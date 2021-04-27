class CreateBuyersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_stocks do |t|
      t.integer :unit
      t.references :user
      t.references :stock
      t.timestamps
    end
  end
end
