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
require "test_helper"

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
