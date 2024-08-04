# == Schema Information
#
# Table name: unit_owner_checklist_items
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  checklist_id       :bigint           not null
#  checklist_items_id :bigint           not null
#
# Indexes
#
#  index_unit_owner_checklist_items_on_checklist_id        (checklist_id)
#  index_unit_owner_checklist_items_on_checklist_items_id  (checklist_items_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#  fk_rails_...  (checklist_items_id => checklist_items.id)
#
class UnitOwnerChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :checklist_item
end
