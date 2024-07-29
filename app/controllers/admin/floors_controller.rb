class Admin::FloorsController < Admin::BaseController
  before_action :set_apartment
  before_action :set_floor, only: %i[show edit update destroy]
  before_action :set_filter, only: %i[show]

  def new
    @floor = @current_apartment.floors.build
  end

  def show
    @pagy, @units = pagy(@filter.scope.latest)
  end

  def create
    @floor = @current_apartment.floors.build(floor_params)

    respond_to do |format|
      if @floor.save
        format.html {redirect_to apartment_path(@current_apartment), notice: "Floor added successfully" }
        # format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @floor.update(floor_params)
        format.html { redirect_to apartment_path(@current_apartment), notice: "Floor updated successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @floor.destroy
    redirect_to apartment_path(@current_apartment), alert: 'Floor Deleted Successfully'
  end

  private

  def floor_params
    params.require(:floor).permit(:name)
  end

  def set_floor
    @floor = @current_apartment.floors.find(params[:id])
  end

  def set_apartment
    @current_apartment = Apartment.find(params[:apartment_id])
  end

  def set_filter
    @filter = params[:filter].present? ? UnitFilter.find(params[:filter]) : UnitFilter.new
    @filter.update(filter_params)
    @filter.update(floor_id: params[:id]) if params[:id].present?
  end

  def filter_params
    params.permit(:search, :floor_id)
  end

end