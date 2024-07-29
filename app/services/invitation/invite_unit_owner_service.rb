class Invitation::InviteUnitOwnerService < ApplicationService
  attr_reader :current_admin_user, :invite_params
  attr_accessor :errors

  def initialize(current_admin_user, invite_params)
    @current_admin_user = current_admin_user
    @invite_params = invite_params
    @errors = []
  end

  def call
    add_unit_owner
  end

  def add_unit_owner
    return add_error('This unit is not vacant') if vacant_unit?
    return add_error('There is an already existing owner with this email') if existing_unit_owner?

    invitee = UnitOwner.invite!({email: invite_params[:email]}, current_admin_user)
    create_owner_information(invitee)
  end

  def create_owner_information(invitee)
    OwnerInformation.create!(unit_id: unit.id , unit_owner_id: invitee.id) if invitee
  end

  def unit
    Unit.find(@invite_params.dig(:unit_id))
  end

  def vacant_unit?
    # Remember to add status for checking if the unit owner is the current unit owner
    unit.unit_owners.owner_informations.where(unit_id: unit, status: ["current", "invited"]).present?
  end

  def existing_unit_owner?
    # Remember to add status for checking if the unit owner is the current unit owner
    unit_owner = UnitOwner.find_by(email: @invite_params.dig(:email))
    unit.unit_owners.owner_informations.where(status: ["current", "invited"]).present?
  end

  def add_error(message)
    @errors << message
  end

end