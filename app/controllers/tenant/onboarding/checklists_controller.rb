module Tenant
  class Onboarding::ChecklistsController < Onboarding::BaseController

    def new
      @checklist = Checklist.new
    end

    def create
      @checklist = Checklist.new(owner_informations_params)

      respond_to do |format|
        if @checklist.save
          format.html { redirect_to '/t/dashboard/index', notice: "Profile updated successfully" }
        else
          format.html { render :edit, status: :unprocessable_entity}
        end
      end
    end

    private

    def checklist_params
      params.require(:checklist).permit()
    end
  end
end