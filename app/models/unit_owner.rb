class UnitOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owner_informations
  has_many :units, through: :owner_informations
  has_many :unit_payments

  scope :search_with, lambda { |q|
    where("email ILIKE ?", "%#{q}%")
  }

end
