class DropTablename < ActiveRecord::Migration[6.0]
  def change
    drop_table :buyers_stocks
  end
end
