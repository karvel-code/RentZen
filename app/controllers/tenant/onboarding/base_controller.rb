module Tenant
  class Onboarding::BaseController < Tenant::BaseController
    before_action :authenticate_unit_owner!
    layout 'onboarding/base'
  end
end