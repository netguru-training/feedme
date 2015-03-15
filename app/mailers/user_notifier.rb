class UserNotifier < ApplicationMailer
  default from: 'feedme@example.com'

  def notification_email(user, products)
    @user = user
    @products = products
    mail(:to => @user.email, :subject => 'FeedMe - Your order is started')
  end
end
