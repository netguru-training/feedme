class UserNotifier < ApplicationMailer
  default from: 'feedme@example.com'

  def notification_email(user)
    @user = user
    mail(:to => @user.email, :subject => 'food is ready')
  end
end
