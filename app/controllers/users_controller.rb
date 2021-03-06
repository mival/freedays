class UsersController < ApplicationController
  def index
    authorize User
    users = policy_scope(User)
    users = users.username_start(params.dig(:filter, :username)) if params.dig(:filter, :username)
    users = users.paginate(:page => params.dig(:page, :number) || 1, :per_page => params.dig(:page, :size) || 100)
    users = users.includes(params[:include])
    render json: users #, include: params[:include] # important or [:vacation_requests]
  end

  def show
    @user = if params[:id]
              User.find(params[:id])
            else
              current_user
            end
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #UserMailer.with(user: @user).welcome_email.deliver_later
    end
    render_jsonapi(@user) # important
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params)
    render_jsonapi(@user)
  end

  def destroy
    authorize User
    @user = User.find(params[:id])
    if @user.destroy
      head(:no_content)
    else
      render_jsonapi_errors(@user)
    end
  end

  private
  def user_params
    jsonapi_params.slice(:username, :password, :role, :name, :surname, :phone, :email, :total_days, :language, :push_token)
  end

  def update_params
    jsonapi_params.slice(:username, :role, :name, :surname, :phone, :email, :total_days, :language, :push_token)
  end
end
