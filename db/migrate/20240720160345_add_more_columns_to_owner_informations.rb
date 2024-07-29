class AddMoreColumnsToOwnerInformations < ActiveRecord::Migration[7.0]
  def change
    add_column :owner_informations, :first_name, :string, null: false, default: ""
    add_column :owner_informations, :surname, :string, null: false, default: ""
    add_column :owner_informations, :middle_name, :string
    add_column :owner_informations, :phone, :string, null: false, default: ""
    add_column :owner_informations, :gender, :string
    add_column :owner_informations, :avatar, :string, default: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
  end
end
