class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :company_name, null: false
      t.string :contact_person_name, null: false, default: ""
      t.string :company_email, null: false, default: ""
      t.decimal :onboarding_completion_percentage
      t.datetime :onboarding_completed_at
      t.string :address

      t.timestamps
    end
  end
end
