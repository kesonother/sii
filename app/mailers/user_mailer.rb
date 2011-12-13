# encoding: utf-8
class UserMailer < ActionMailer::Base

  default :from => "\"choopro\" <kesonother@gmail.com>"

  

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to choopro")
  end
  
  def receive_post(email)

    mail(:to => email, :subject => "Requête reçu")
  end
  
end
