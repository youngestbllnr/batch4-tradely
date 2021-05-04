class CreateBrokersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :brokers_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
