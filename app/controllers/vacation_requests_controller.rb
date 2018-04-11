class VacationRequestsController < ApplicationController
  def index
    @vacations = VacationRequest.all
    authorize @vacations
    @vacations = @vacations.accepted if current_user.role =='worker'
    @vacations = @vacations.status(params.dig(:filter, :status)) if params.dig(:filter, :status) && (current_user.role == 'admin' || current_user.role == 'supervisor')
    render json: @vacations, include: params[:include]
  end

  def show
    @vacations = VacationRequest.find(params[:id])
    render json: @vacations
  end

  def my_vacations
    @vacations = VacationRequest.all
    authorize @vacations
    @vacations = @vacations.where(user_id: current_user.id)
    render json: @vacations
  end

  def create
    @vacation =  VacationRequest.new(vacation_params)
    authorize @vacation
    @vacation.save
    render_jsonapi(@vacation)
  end

  def update
    @vacation = VacationRequest.find(params[:id])
    authorize @vacation
    params = vacation_params
    if current_user.role == 'worker'
      params['accepted'] = nil
    end
    @vacation.update(params)
    render_jsonapi(@vacation)
  end

  def destroy
    @vacation = VacationRequest.find(params[:id])
    authorize @vacation
    if @vacation.destroy
      head(:no_content)
    else
      render_jsonapi_errors(@vacation)
    end
  end

  private

  def vacation_params
    jsonapi_params.slice(:start_day, :end_day, :accepted, :user_id)
  end
end