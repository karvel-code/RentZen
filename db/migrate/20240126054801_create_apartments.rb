class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.integer :no_of_floors, null: false
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
    add_index :apartments, :name
  end
end
