# == Schema Information
#
# Table name: owner_informations
#
#  id            :bigint           not null, primary key
#  avatar        :string           default("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
#  first_name    :string           default(""), not null
#  gender        :string
#  middle_name   :string
#  phone         :string           default(""), not null
#  status        :string           default("invited"), not null
#  surname       :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  unit_id       :bigint           not null
#  unit_owner_id :bigint           not null
#
# Indexes
#
#  index_owner_informations_on_unit_id        (unit_id)
#  index_owner_informations_on_unit_owner_id  (unit_owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (unit_owner_id => unit_owners.id)
#
require "test_helper"

class OwnerInformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
