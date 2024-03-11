class Account < ApplicationRecord
  # Associations
  has_many :landlords
  has_many :apartments

  # Validations
  validates :company_email, :company_name, :contact_person_name, presence: true
end
