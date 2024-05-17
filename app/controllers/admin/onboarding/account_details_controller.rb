module Admin
  class Onboarding::AccountDetailsController < Onboarding::BaseController

    def new
      @account = Account.new
    end

    def create
      @account = Account.new(account_params)
      
      if @account.save
        redirect_to new_onboarding_admin_user_detail_path(account_id: @account.id), notice: "Account Created Successfully"
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def account_params
      params.require(:account).permit(:company_email, :company_name, :contact_person_name, :address)
    end
  end
end