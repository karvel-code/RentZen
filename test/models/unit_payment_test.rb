# == Schema Information
#
# Table name: unit_payments
#
#  id            :bigint           not null, primary key
#  amount_due    :decimal(, )      not null
#  amount_paid   :decimal(, )      default(0.0), not null
#  date          :date
#  description   :string
#  status        :string           default("pending"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  unit_id       :bigint           not null
#  unit_owner_id :bigint           not null
#
# Indexes
#
#  index_unit_payments_on_unit_id        (unit_id)
#  index_unit_payments_on_unit_owner_id  (unit_owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (unit_owner_id => unit_owners.id)
#
require "test_helper"

class UnitPaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
