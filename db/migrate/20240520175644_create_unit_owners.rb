class CreateUnitOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_owners do |t|
      t.string :email, null: false
      
      t.timestamps
    end
  end
end
