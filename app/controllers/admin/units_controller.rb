class Admin::UnitsController < Admin::BaseController
  before_action :set_unit, only: %i[show edit update destroy]
  before_action :set_filter, only: %i[index]

  def index
    @pagy, @units = pagy(@filter.scope.latest)
  end

  def new
    @unit = Unit.new
  end

  def show
    @unit_owners = @unit.unit_owners.order(created_at: :desc)
  end

  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html {redirect_to units_path, notice: "Unit added successfully" }
        # format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html {redirect_to units_path, notice: "Unit updated successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @unit.destroy
    redirect_to units_path, alert: 'Unit Deleted Successfully'
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :unit, :floor_id)
  end

  def set_unit
    @unit = Unit.find(params[:id])
  end

  def set_filter
    @filter = params[:filter].present? ? UnitFilter.find(params[:filter]) : UnitFilter.new
    @filter.update(filter_params)
    @filter.update(current_account_id: current_account.id)
  end

  def filter_params
    params.permit(:search, :floor_id, :current_account_id)
  end

end