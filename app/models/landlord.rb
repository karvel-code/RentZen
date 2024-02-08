class Landlord < ApplicationRecord
  # Associations
  belongs_to :account

  # Validations
  validates :first_name, :surname, :phone, presence: true
end
