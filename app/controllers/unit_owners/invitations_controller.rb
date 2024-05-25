class UnitOwners::InvitationsController < Devise::InvitationsController

  def new
    # binding.irb
    self.resource = UnitOwner.new
    render :new
  end

  def create
    self.resource = invite_resource
    resource_invited = resource.errors.empty?

    yield resource if block_given?

    if resource_invited
      if is_flashing_format? && self.resource.invitation_sent_at
        set_flash_message :notice, :send_instructions, email: self.resource.email
      end
      redirect_to floor_unit_path(floor_id: resource.unit.floor.id ,id: resource.unit.id)
    else
      respond_with(resource)
    end
  end

  def after_accept_path_for(resource)
    if resource.is_a?(UnitOwner)
      '/t/dashboard/index'
    end
  end

  protected

  def invite_resource(&block)
    # resource_class.invite!(invite_params, current_inviter, &block)
    existing_user = UnitOwner.find_by(email: invite_params[:email])

    if existing_user
      flash[:error] = "The email #{email} you are trying to invite already exists."
      return existing_user
    end

    invitable = UnitOwner.invite!(invite_params.except(:owner_informations_attributes), current_inviter)

    if invitable.save && invitable.owner_informations.nil?
      unit_id = invite_params.dig(owner_informations_attributes, 0, :unit_id)
      OwnerInformation.create(unit_owner_id: invitable.id, unit_id: unit_id )
    end

    block&.call(invitable)
    invitable
  end

  def current_inviter
    authenticate_admin_user!
  end

  def invite_params
    params.require(:tenant).permit(:email, owner_informations_attributes: [:unit_id])
  end
end