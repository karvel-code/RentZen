class Account < ApplicationRecord
  # Associations
  has_many :admin_users
  has_many :apartments, dependent: :destroy
  has_many :floors, through: :apartments
  has_many :units, through: :floors

  # Validations
  validates :company_email, :company_name, :contact_person_name, presence: true
end
