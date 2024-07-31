class Admin::UnitOwnersController < Admin::BaseController
  before_action :set_unit_owner, only: %i[show]
  before_action :set_filter, only: %i[index]

  def index
    @pagy, @unit_owners = pagy(@filter.scope.latest)
  end

  def show
  end

  private


  def set_unit_owner
    @unit = Unit.find(params[:id])
  end

  def set_filter
    @filter = params[:filter].present? ? UnitOwnerFilter.find(params[:filter]) : UnitOwnerFilter.new
    @filter.update(filter_params)
    @filter.update(current_account_id: current_account.id)
  end

  def filter_params
    params.permit(:search, :current_account_id)
  end

end