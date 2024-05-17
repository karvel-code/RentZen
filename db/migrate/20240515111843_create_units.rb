class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
    add_index :units, :name
  end
end
