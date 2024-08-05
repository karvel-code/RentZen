# == Schema Information
#
# Table name: checklist_item_responses
#
#  id                           :bigint           not null, primary key
#  description                  :text
#  response                     :boolean
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  unit_owner_checklist_item_id :bigint           not null
#  unit_owner_id                :bigint
#
# Indexes
#
#  index_checklist_item_responses_on_unit_owner_checklist_item_id  (unit_owner_checklist_item_id)
#  index_checklist_item_responses_on_unit_owner_id                 (unit_owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_owner_checklist_item_id => unit_owner_checklist_items.id)
#  fk_rails_...  (unit_owner_id => unit_owners.id)
#
class ChecklistItemResponse < ApplicationRecord
  belongs_to :unit_owner
  belongs_to :unit_owner_checklist_item
end
