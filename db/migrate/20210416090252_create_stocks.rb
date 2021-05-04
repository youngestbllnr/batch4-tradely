class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.integer :current_price
      t.integer :change
      t.integer :previous_close

      t.timestamps
    end
  end
end

