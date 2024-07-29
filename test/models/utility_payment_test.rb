# == Schema Information
#
# Table name: utility_payments
#
#  id              :bigint           not null, primary key
#  amount          :decimal(, )      not null
#  description     :string
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  unit_payment_id :bigint           not null
#
# Indexes
#
#  index_utility_payments_on_unit_payment_id  (unit_payment_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_payment_id => unit_payments.id)
#
require "test_helper"

class UtilityPaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
