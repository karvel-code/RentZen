class CreateOwnerInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :owner_informations do |t|
      t.references :unit_owner, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
