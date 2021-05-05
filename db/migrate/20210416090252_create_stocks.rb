class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.decimal :price
      t.string :change

      t.timestamps
    end
  end
end

