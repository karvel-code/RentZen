class Admin::UnitOwner::InvitationsController < Admin::BaseController

  def new
    @unit = Unit.find(params[:unit_id])
    @floor = @unit.floor
    @unit_owner = UnitOwner.new
  end

  def create
    invite_service = Invitation::InviteUnitOwnerService.new(current_admin_user, invite_params)
    unit = invite_service.unit
    
    ActiveRecord::Base.transaction do
      invite_service.call
    end

    if invite_service.errors.empty?
      redirect_to floor_unit_path(floor_id: unit.floor.id, id: unit.id ), notice: "You have successfully invited a tenant to this unit."
    else
      redirect_to floor_unit_path(floor_id: unit.floor.id, id: unit.id ), alert: "#{invite_service.errors.to_sentence}"
    end
  end

  private

  def invite_params
    params.require(:unit_owner).permit(:email, :unit_id)
  end
end