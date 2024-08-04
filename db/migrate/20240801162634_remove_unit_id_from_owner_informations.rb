class RemoveUnitIdFromOwnerInformations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :owner_informations, :unit, null: false, foreign_key: true
    # remove_column :owner_informations, :status, :string
  end
end
