class CreateLeaseAgreements < ActiveRecord::Migration[7.0]
  def change
    create_enum :status, %w[invited current outgoing past]

    create_table :lease_agreements do |t|
      t.references :unit_owner, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.enum :status, enum_type: :status, default: "invited"

      t.timestamps
    end
  end
end
