class VacationRequestsController < ApplicationController

  def index
    @vacations = policy_scope(VacationRequest.all)
    authorize @vacations
    @vacations = @vacations.by_user(params.dig(:filter, :user)) if params.dig(:filter, :user)
    @vacations = @vacations.status(params.dig(:filter, :status)) if params.dig(:filter, :status) && (current_user.role == 'admin' || current_user.role == 'supervisor')
    @vacations = @vacations.calendar(params.dig(:filter, :calendar)) if params.dig(:filter, :calendar)
    @vacations = @vacations.date_range(params.dig(:filter, :start_date), params.dig(:filter, :end_date)) if params.dig(:filter, :start_date) && params.dig(:filter, :end_date)
    render json: @vacations, include: params[:include]
  end

  def show
    @vacations = VacationRequest.find(params[:id])
    render json: @vacations, include: [:documents]
  end

  def create
    @vacation =  VacationRequest.new(create_params)
    @vacation.user ||= current_user
    @vacation.accepted = nil
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
    @user = User.find(@vacation.user_id)
    if @vacation.update(params)
      VacationRequestMailer.with(vacation_request: @vacation, user: @user).change_status.deliver_later
    end
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
    jsonapi_params.slice(:start_day, :end_day, :accepted, :user_id, :vacation_type_id)
  end

  def create_params
    jsonapi_params.slice(:start_day, :end_day, :user_id, :vacation_type_id, :document_ids)
  end
end
