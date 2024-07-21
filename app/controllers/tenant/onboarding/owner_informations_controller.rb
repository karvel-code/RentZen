module Tenant
  class Onboarding::OwnerInformationsController < Onboarding::BaseController
    before_action :set_owner_information

    def edit; end

    def update
      respond_to do |format|
        if @owner_information.update(owner_informations_params)
          format.html { redirect_to '/t/dashboard/index', notice: "Profile updated successfully" }
        else
          format.html { render :edit, status: :unprocessable_entity}
        end
      end
    end

    private

    def set_owner_information
      @owner_information = current_unit_owner.owner_informations.find(params[:id])
    end

    def owner_informations_params
      params.require(:owner_information).permit(:first_name, :middle_name, :surname, :phone, :gender, :avatar)
    end
  end
end