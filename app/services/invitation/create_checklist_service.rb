class Invitation::CreateChecklistService < ApplicationService
  attr_reader :lease_agreement, :current_admin_user

  def initialize(lease_agreement, current_admin_user)
    @lease_agreement = lease_agreement
    @current_admin_user = current_admin_user
  end

  def call
    ActiveRecord::Base.transaction do
      create_checklist
      create_checklist_items
    end
  rescue ActiveRecord::RecordInvalid => e
    # Handle error appropriately, e.g., log it or re-raise it
    Rails.logger.error("Failed to create checklist: #{e.message}")
    raise
  end

  private

  def current_account
    @current_account ||= current_admin_user.account
  end

  def create_checklist
    @new_checklist ||= Checklist.create!(lease_agreement_id: lease_agreement.id)
  end

  def create_checklist_items
    current_account.checklist_items.each do |checklist_item|
      # binding.irb
      UnitOwnerChecklistItem.create!(
        checklist_id: new_checklist.id,
        checklist_item_id: checklist_item.id
      )
    end
  end

  def new_checklist
    @new_checklist
  end
end
