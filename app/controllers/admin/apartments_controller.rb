class Admin::ApartmentsController < Admin::BaseController
  before_action :set_apartment, only: %i[edit update destroy]
  before_action :set_account, only: %i[create]

  def index
    @apartments = Apartment.order("created_at DESC")
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = @current_account.apartments.build(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html {redirect_to apartments_path, notice: "Apartment added successfully" }
        format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
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
    params.require(:apartment).permit(:name, :location, :no_of_floors)
  end

  def set_account
    @current_account = Account.first
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
  
end