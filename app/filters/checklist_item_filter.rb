class ChecklistItemFilter < AllFutures::Base
  attribute :search, :string
  attribute :current_account_id, :string

  def current_account
    Account.find(current_account_id)
  end

  def scope
    current_account.checklist_items
                  .search_with(search)
  end
end
