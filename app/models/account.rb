class Account < ApplicationRecord
  # Associations
  has_many :admin_users
  has_many :apartments, dependent: :destroy

  # Validations
  validates :company_email, :company_name, :contact_person_name, presence: true
end
