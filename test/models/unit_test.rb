# == Schema Information
#
# Table name: units
#
#  id           :bigint           not null, primary key
#  cost         :decimal(, )      default(0.0), not null
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  floor_id     :bigint           not null
#  unit_type_id :bigint           not null
#
# Indexes
#
#  index_units_on_floor_id      (floor_id)
#  index_units_on_name          (name)
#  index_units_on_unit_type_id  (unit_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (floor_id => floors.id)
#  fk_rails_...  (unit_type_id => unit_types.id)
#
require "test_helper"

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
