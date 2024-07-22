class Admin::ApartmentsController < Admin::BaseController
  before_action :set_apartment, only: %i[edit update destroy show]
  before_action :set_account, only: %i[create]

  def index
    @apartments = current_account.apartments.order(created_at: :desc)
  end

  def new
    @apartment = Apartment.new
  end

  def show
    @floors = @apartment.floors.order(created_at: :desc)
  end

  def create
    @apartment = @current_account.apartments.build(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html {redirect_to apartments_path, notice: "Apartment added successfully" }
        # format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to apartments_path, notice: "Apartment updated successfully" }
        # format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @apartment.destroy
    redirect_to apartments_path, alert: 'Apartment Deleted Successfully !'
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