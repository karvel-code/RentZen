class AddCostAndUnitTypeIdToUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :cost, :decimal, null: false, default: 0.0
    add_reference :units, :unit_type, null: false, foreign_key: true
  end
end
