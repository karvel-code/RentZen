class Apartment < ApplicationRecord
  belongs_to :account
  with_options dependent: :destroy do
    has_many :floors
    has_many :units, through: :floors
  end

  after_create_commit :create_floors

  def floor_count
    floors.count
  end
  
  private

  def create_floors
    Apartment::CreateFloorService.call(self)
  end

end
