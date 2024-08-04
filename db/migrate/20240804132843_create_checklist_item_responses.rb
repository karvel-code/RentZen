class CreateChecklistItemResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :checklist_item_responses do |t|
      t.boolean :response
      t.text :description
      t.references :unit_owner_checklist_item, null: false, foreign_key: true
      t.references :unit_owner, foreign_key: true

      t.timestamps
    end
  end
end
