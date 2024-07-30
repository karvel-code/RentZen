class UnitOwnerFilter < AllFutures::Base
  attribute :search, :string
  attribute :unit_id, :string
  attribute :status, :string
  attribute :gender, :string
  attribute :current_account_id, :string

  def scope
    UnitOwner.search_with(search)
  end
end