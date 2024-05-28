class Admin::UnitOwner::InvitationsController < Admin::BaseController

  def new
    @unit = Unit.find(params[:unit_id])
    @floor = @unit.floor
    @unit_owner = UnitOwner.new
  end

  def create
    existing_unit_owner = UnitOwner.find_by(email: invite_params[:email])

    if existing_unit_owner
      flash[:error] = "The email #{invite_params[:email]} you are trying to invite already exists."
      return existing_unit_owner
    end

    invitee = UnitOwner.invite!({email: invite_params[:email]}, current_admin_user)
    
    unit_id = invite_params.dig(:owner_informations_attributes, 0, :unit_id)
    OwnerInformation.create(unit_id: unit_id , unit_owner_id: invitee.id) if invitee
  end

  private

  def invite_params
    params.require(:unit_owner).permit(:email, owner_informations_attributes: [:unit_id])
  end

  def unit_id_params
    invite_params.dig(:owner_informations_attributes, 0, :unit_id)
  end
end