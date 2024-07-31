# == Schema Information
#
# Table name: accounts
#
#  id                               :bigint           not null, primary key
#  address                          :string
#  company_email                    :string           default(""), not null
#  company_name                     :string           not null
#  contact_person_name              :string           default(""), not null
#  onboarding_completed_at          :datetime
#  onboarding_completion_percentage :decimal(, )
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
class Account < ApplicationRecord
  # Associations
  has_many :admin_users
  has_many :apartments, dependent: :destroy
  has_many :floors, through: :apartments
  has_many :units, through: :floors

  # Validations
  validates :company_email, :company_name, :contact_person_name, presence: true
end
