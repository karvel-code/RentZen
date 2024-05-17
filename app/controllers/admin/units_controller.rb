class Admin::UnitsController < Admin::BaseController
  before_action :set_floor
  before_action :set_unit, only: %i[show edit update destroy]

  def new
    @unit = @floor.units.build
  end

  def show; end

  def create
    @unit = @floor.units.build(unit_params)

    respond_to do |format|
      if @unit.save
        format.html {redirect_to floor_path(@floor), notice: "Unit added successfully" }
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
        format.html { redirect_to floor_path(@floor), notice: "Unit updated successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @unit.destroy
    redirect_to floor_path(@floor), notice: 'Floor Deleted Successfully'
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end

  def apartment
    @floor.apartment
  end

  def set_unit
    @unit = @floor.units.find(params[:id])
  end

  def set_floor
    @floor = Floor.find(params[:floor_id])
  end

end