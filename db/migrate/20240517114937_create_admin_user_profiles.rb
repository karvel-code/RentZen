class CreateAdminUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_user_profiles do |t|
      t.string :first_name, null: false
      t.string :surname, null: false
      t.string :phone, null: false
      t.references :admin_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
