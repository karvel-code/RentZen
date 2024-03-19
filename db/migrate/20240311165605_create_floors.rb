class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.string :name, null: false
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :floors, :name
  end
end
