class Apartment < ApplicationRecord
  belongs_to :account
  has_many :floors
end
