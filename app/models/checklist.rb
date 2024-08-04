# == Schema Information
#
# Table name: checklists
#
#  id                 :bigint           not null, primary key
#  description        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lease_agreement_id :bigint           not null
#
# Indexes
#
#  index_checklists_on_lease_agreement_id  (lease_agreement_id)
#
# Foreign Keys
#
#  fk_rails_...  (lease_agreement_id => lease_agreements.id)
#
class Checklist < ApplicationRecord
end
