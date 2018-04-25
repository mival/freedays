class UserMailer < ApplicationMailer
  default from: 'gianmarcogh20@gmail.com'

  def welcome_email
      @user = params[:user]
      @url = 'http://localhost:3000/users'
      mail(to: @user.email, subject: 'Done')
  end
end