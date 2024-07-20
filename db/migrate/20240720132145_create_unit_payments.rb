class CreateUnitPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_payments do |t|
      t.references :unit_owner, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.string :status, null: false, default: "pending"
      t.string :description
      t.decimal :amount_due, null: false
      t.decimal :amount_paid, null: false, default: 0.0
      t.date :date

      t.timestamps
    end
  end
end
