module Admin
  class Onboarding::LandlordDetailsController < Onboarding::BaseController
    
    def new
      @landlord = Landlord.new
    end

  end
end