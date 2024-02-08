class Account < ApplicationRecord
  # Associations
  has_many :landlords

  # Validations
  validates :company_email, :company_name, :contact_person_name, presence: true
end
