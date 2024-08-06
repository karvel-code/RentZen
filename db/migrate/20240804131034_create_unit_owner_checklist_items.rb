class CreateUnitOwnerChecklistItems < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_owner_checklist_items do |t|
      t.references :checklist, null: false, foreign_key: true
      t.references :checklist_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
