class Usermailer < ApplicationMailer
  default from: "s3358326@rmit.edu.vn"

  def send_new_user_message(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the Kblog")
  end
end
