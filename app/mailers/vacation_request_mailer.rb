class VacationRequestMailer < ApplicationMailer
  default from: 'admin@iquest.cz'

  def change_status
    @vacation_request = params[:vacation_request]
    @user = params[:user]
    @url  = 'http://iquest-planner.cz/login'
    mail(to: @user.email, subject: 'Your vacation request status have been updated')
  end
end
