class ChangeDataTypeForUnits < ActiveRecord::Migration[6.0]
  def change
    change_table :buyers_stocks do |t|
      t.change :units, :integer
    end

    change_table :transactions do |t|
      t.change :units, :integer
    end
  end
end
