class FloorFilter < AllFutures::Base
  attribute :search, :string
  attribute :apartment_id, :string

  def current_apartment
    Apartment.find(apartment_id)
  end

  def scope
    current_apartment.floors
                  .search_with(search)
  end
end