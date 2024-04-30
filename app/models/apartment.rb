class Apartment < ApplicationRecord
  belongs_to :account
  has_many :floors, dependent: :destroy

  after_create_commit :create_floors
  
  private

  def create_floors
    Apartment::CreateFloorService.call(self)
  end

end
