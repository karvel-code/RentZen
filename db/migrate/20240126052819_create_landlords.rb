class CreateLandlords < ActiveRecord::Migration[7.0]
  def change
    create_table :landlords do |t|
      t.string :first_name, null: false
      t.string :surname, null: false
      t.string :phone
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
