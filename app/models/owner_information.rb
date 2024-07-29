class OwnerInformation < ApplicationRecord
  belongs_to :unit
  belongs_to :unit_owner
  
  enum status: {
    invited: 'invited',
    current: 'current',
    past: 'past'
  }

  class << self
    def current_unit_info(unit_id, unit_owner_id)
      self.find_by(unit_id: unit_id, unit_owner_id: unit_owner_id)
    end
  end
end
