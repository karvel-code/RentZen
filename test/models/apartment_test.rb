# == Schema Information
#
# Table name: apartments
#
#  id           :bigint           not null, primary key
#  latitude     :decimal(, )
#  location     :string           not null
#  longitude    :decimal(, )
#  name         :string           not null
#  no_of_floors :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :bigint           not null
#
# Indexes
#
#  index_apartments_on_account_id  (account_id)
#  index_apartments_on_name        (name)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "test_helper"

class ApartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
