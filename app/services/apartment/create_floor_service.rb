class Apartment::CreateFloorService < ApplicationService

  def initialize(apartment)
    @apartment = apartment
  end

  def call
    create_floors
  end
  
  def create_floors
    no_of_floors = @apartment.no_of_floors
    ActiveRecord::Base.transaction do
      Floor.create(name: "Ground Floor", apartment_id: @apartment.id)

      no_of_floors.times do |floor|
        Floor.create(name: (floor + 1).to_s, apartment_id: @apartment.id)
      end
      
    end
  end
end