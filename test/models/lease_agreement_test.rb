# == Schema Information
#
# Table name: lease_agreements
#
#  id            :bigint           not null, primary key
#  status        :enum             default("invited")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  unit_id       :bigint           not null
#  unit_owner_id :bigint           not null
#
# Indexes
#
#  index_lease_agreements_on_unit_id        (unit_id)
#  index_lease_agreements_on_unit_owner_id  (unit_owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (unit_owner_id => unit_owners.id)
#
require "test_helper"

class LeaseAgreementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
