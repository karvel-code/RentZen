class ApartmentFilter < AllFutures::Base
  attribute :search, :string
  attribute :current_account_id, :string

  def current_account
    Account.first
  end

  def scope
    current_account.apartments
                  .search_with(search)
  end
end