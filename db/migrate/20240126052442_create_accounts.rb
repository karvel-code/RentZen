class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :company_name, null: false
      t.string :contact_person_name, null: false, default: ""
      t.string :company_email, null: false, default: ""

      t.timestamps
    end
  end
end
