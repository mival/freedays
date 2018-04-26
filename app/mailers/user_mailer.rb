class UserMailer < ApplicationMailer
  default from: 'gianmarcogh20@gmail.com'

  def welcome_email
      @user = params[:user]
      @url = 'http://localhost:3000/users'
      mail(to: @user.email, subject: 'Done')
  end

  def password_lost
    @email = params[:email]
    @url = "http://localhost:3000/passwords?token=#{token}"
    mail(to: @email, subject: 'Password recovery')
  end
end