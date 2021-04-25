class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.date :buy_date
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
