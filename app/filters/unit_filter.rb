class UnitFilter < AllFutures::Base
  attribute :search, :string
  attribute :floor_id, :string
  attribute :current_account_id, :string

  def current_floor
    Floor.find(floor_id)
  end

  def scope
    current_floor.units
                  .search_with(search)
  end
end