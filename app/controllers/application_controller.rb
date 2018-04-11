class ApplicationController < ActionController::API
  include Pundit
  before_action :log_jsonapi_params
  before_action :authenticate_request
  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def jsonapi_params(**options)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, options)
  end

  def log_jsonapi_params
    logger.debug "JSONAPI params: #{jsonapi_params}"
  end

  def current_user
    @current_user ||= AuthorizeApiRequest.call(request.headers).result
  end

  def authenticate_request
    render json: { error: 'Not Authorized' }, status: 401 unless current_user
  end

  def user_not_authorized
    render json: {error: 'not authorized'}, status: 403
  end

  def render_jsonapi(resource, **options)
    if resource.valid?
      render json: resource, **options
    else
      render_jsonapi_errors(resource)
    end
  end

  def render_jsonapi_errors(resource)
    render json: resource, status: 422, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
