module Admin
  class Onboarding::AdminUserDetailsController < Onboarding::BaseController
    
    def new
      @admin_user = current_admin_user.build_admin_user_profile
    end

    def create
      @admin_user = current_admin_user.build_admin_user_profile(admin_user_params)
      
        if @admin_user.save
          redirect_to dashboard_index_path, notice: "Onboarding completed Successfully"
        else
          render :new, status: :unprocessable_entity
        end
    end

    private

    def landlord_params
      params.require(:admin_user).permit(:first_name, :surname, :phone)
    end
  end
end