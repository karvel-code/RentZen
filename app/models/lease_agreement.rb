# == Schema Information
#
# Table name: lease_agreements
#
#  id            :bigint           not null, primary key
#  status        :string           default("invited"), not null
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
class LeaseAgreement < ApplicationRecord
  belongs_to :unit
  belongs_to :unit_owner
  
  enum status: {
    invited: 'invited',
    current: 'current',
    outgoing: 'outgoing',
    past: 'past'
  }
end
