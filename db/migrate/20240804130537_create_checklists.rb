class CreateChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :checklists do |t|
      t.string :description
      t.references :lease_agreement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
