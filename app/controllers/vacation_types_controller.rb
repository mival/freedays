class VacationTypesController < ApplicationController
  def index
    @vacationtypes = VacationType.all
    authorize @vacationtypes
    render json: @vacationtypes
  end

  def show
    @vacationtype = VacationType.find(params[:id])
    authorize @vacationtype
    render json: @vacationtype
  end

  def create
    @vacation = VacationType.new(create_params)
    @vacation.save
    render_jsonapi(@vacation)
  end

  def update
    @vacation = VacationType.find(params[:id])
    @vacation.update(update_params)
    render_jsonapi(@vacation)
  end

  def delete
    @vacation = @vacation.find(params[:id])
  end
  private

  def create_params
    jsonapi_params.slice(:name)
  end

  def update_params
    jsonapi_params.slice(:name, :active)
  end
end
 