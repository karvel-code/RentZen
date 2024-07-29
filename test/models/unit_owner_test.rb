# == Schema Information
#
# Table name: unit_owners
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :bigint
#
# Indexes
#
#  index_unit_owners_on_email                 (email) UNIQUE
#  index_unit_owners_on_invitation_token      (invitation_token) UNIQUE
#  index_unit_owners_on_invited_by            (invited_by_type,invited_by_id)
#  index_unit_owners_on_invited_by_id         (invited_by_id)
#  index_unit_owners_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UnitOwnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
