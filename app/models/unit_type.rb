# == Schema Information
#
# Table name: unit_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UnitType < ApplicationRecord
  include Comboboxable

  has_many :units

end
