class UserNotifierMailer < ApplicationMailer
   default :from => 'vamsikrishna9025@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user, visit, qrcode)
    @user = user
    @visit = visit
    @qrcode = qrcode
    subject = "Welcome to Resident Visitor Portal"
    mail( :to => visit.email, :subject => subject )
  end
end
