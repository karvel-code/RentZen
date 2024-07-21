module Admin
  class Onboarding::BaseController < Admin::BaseController
    before_action :authenticate_admin_user!
    layout 'onboarding/base'
  end
end