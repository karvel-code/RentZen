# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  floor_id   :bigint           not null
#
# Indexes
#
#  index_units_on_floor_id  (floor_id)
#  index_units_on_name      (name)
#
# Foreign Keys
#
#  fk_rails_...  (floor_id => floors.id)
#
class Unit < ApplicationRecord
  belongs_to :floor
  belongs_to :unit_type
  has_many :owner_informations
  has_many :unit_owners, through: :owner_informations
  has_many :unit_payments

end
