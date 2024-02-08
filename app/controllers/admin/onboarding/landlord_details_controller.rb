module Admin
  class Onboarding::LandlordDetailsController < Onboarding::BaseController
    
    def new
      @landlord = Landlord.new
    end

    def create
      @landlord = Landlord.new(landlord_params)
      
        if @landlord.save
          redirect_to dashboard_index_path, notice: "Onboarding completed Successfully"
        else
          render :new, status: :unprocessable_entity
        end
    end

    private

    def landlord_params
      params.require(:landlord).permit(:first_name, :surname, :phone, :account_id)
    end
  end
end