class Unit < ApplicationRecord
  belongs_to :floor
  has_many :owner_informations
  has_many :unit_owners, through: :owner_informations

end
