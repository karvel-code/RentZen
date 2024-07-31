class UnitFilter < AllFutures::Base
  attribute :search, :string
  attribute :floor_id, :string
  attribute :current_account_id, :string

  def current_account
    Account.find(current_account_id)
  end

  def floor
    Floor.find(floor_id)
  end

  def scope
    Unit.where({ floor_id: floor_id }.compact_blank)
          .search_with(search)
    # current_account.units
    #               .where({ floor_id: floor_id }.compact_blank)
    #               .search_with(search)
  end
end