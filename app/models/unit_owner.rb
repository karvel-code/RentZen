class UnitOwner < ApplicationRecord
  has_many :owner_informations
  has_many :units, through: :owner_informations
end
