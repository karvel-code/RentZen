class CreateChecklistItems < ActiveRecord::Migration[7.0]
  def change
    create_table :checklist_items do |t|
      t.string :description, null: false
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
