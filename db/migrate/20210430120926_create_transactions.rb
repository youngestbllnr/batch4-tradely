class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :buyers_stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
