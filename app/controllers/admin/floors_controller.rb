class Admin::FloorsController < Admin::BaseController
  def index
  end

  def show
    @floor = Floor.find(params[:id])
  end

  def destroy
  end
end