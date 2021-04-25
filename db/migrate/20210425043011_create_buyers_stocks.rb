class CreateBuyersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_stocks do |t|
      t.string :symbol
      t.string :company
      t.float :current_Price
      t.float :change
      t.float :previous_close
      t.references :user

      t.timestamps
    end
  end
end
