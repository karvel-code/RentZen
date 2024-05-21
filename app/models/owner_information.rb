class OwnerInformation < ApplicationRecord
  belongs_to :unit
  belongs_to :unit_owner
  
  enum status: {
    invited: 'invited',
    current: 'current',
    past: 'past'
  }
end
