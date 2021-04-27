class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :company_name
      t.float :current_price
      t.float :change
      t.float :previous_close
      t.boolean :on_sale , default: "false"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
