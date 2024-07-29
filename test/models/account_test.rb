# == Schema Information
#
# Table name: accounts
#
#  id                               :bigint           not null, primary key
#  address                          :string
#  company_email                    :string           default(""), not null
#  company_name                     :string           not null
#  contact_person_name              :string           default(""), not null
#  onboarding_completed_at          :datetime
#  onboarding_completion_percentage :decimal(, )
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
require "test_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
