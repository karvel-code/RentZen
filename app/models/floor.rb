class Floor < ApplicationRecord
  belongs_to :apartment
  with_options dependent: :destroy do
    has_many :units
  end
end
