class UserMailer < ApplicationMailer
    def welcome_email
    @user = params[:user]
    @url  = 'http://rocketelevators.ca/login'
    mail(to: @user.email, subject: 'Welcome to Rocket Elevators')
  end


end
