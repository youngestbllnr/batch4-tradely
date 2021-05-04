class UserNotifierMailer < ApplicationMailer
  default from: 'carl@odonto.ph'

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
    subject: 'Thanks for signing up for our amazing app!')
  end

  def send_approval_notification(user)
    @user = user
    mail(to: @user.email,
    subject: 'Your broker account has been approved!')
  end
end
