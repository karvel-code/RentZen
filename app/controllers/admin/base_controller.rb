class Admin::BaseController < ApplicationController
  before_action :authenticate_admin_user!
  layout 'admin/base'

  def current_account
    current_admin_user.account
  end
end
