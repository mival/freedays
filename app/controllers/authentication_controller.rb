class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:username], params[:password])
    AuthorizeApiRequest.call(request.headers).result
    if command.success?
      #@user = User.where(username: params[:username])
      #user.touch(:last_login_at)
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
