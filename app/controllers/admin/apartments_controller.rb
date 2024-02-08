class Admin::ApartmentsController < Admin::BaseController
  before_action :set_apartment, only: %i[edit update destroy]

  def index
    @apartments = Apartment.order("created_at DESC")
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    
    if @apartment.save
      redirect_to apartments_path, notice: "Apartment added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @apartment.update(apartment_params)
      redirect_to apartments_path, notice: "Apartment updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :location, :no_of_units)
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
  
end