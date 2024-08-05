class Admin::ChecklistItemsController < Admin::BaseController
  before_action :set_filter, only: %i[index]
  before_action :set_checklist_item, only: %i[show edit update destroy]

  def index
    @pagy, @checklist_items = pagy(@filter.scope)
  end

  def show; end

  def new
    @checklist_item = ChecklistItem.new
  end

  def create
    @checklist_item = current_account.checklist_items.build(checklist_items_params)
    
    respond_to do |format|
      if @checklist_item.save
        format.html {redirect_to checklist_items_path, notice: "Checklist item added successfully" }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @checklist_item.update(checklist_items_params)
        format.html { redirect_to checklist_items_path, notice: "Checklist item updated successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @checklist_item.destroy
    redirect_to checklist_items_path, alert: 'Checklist item Deleted Successfully'
  end

  private

  def checklist_items_params
    params.require(:checklist_item).permit(:description)
  end

  def set_checklist_item
    @checklist_item = ChecklistItem.find(params[:id])
  end

  def set_filter
    @filter = params[:filter].present? ? ChecklistItemFilter.find(params[:filter]) : ChecklistItemFilter.new
    @filter.update(filter_params)
    @filter.update(current_account_id: current_account.id)
  end

  def filter_params
    params.permit(:search, :current_account_id)
  end
end