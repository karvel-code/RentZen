# == Schema Information
#
# Table name: floors
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  apartment_id :bigint           not null
#
# Indexes
#
#  index_floors_on_apartment_id  (apartment_id)
#  index_floors_on_name          (name)
#
# Foreign Keys
#
#  fk_rails_...  (apartment_id => apartments.id)
#
require "test_helper"

class FloorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
