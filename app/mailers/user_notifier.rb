class UserNotifier < ApplicationMailer
  default from: 'feedme@example.com'

  def finalized_email(user, products)
    @user = user
    @products = products
    mail(:to => @user.email, :subject => 'FeedMe - Your order is started')
  end

  def delivered_email(user)
    @user = user
    mail(:to => @user.email, :subject => 'FeedMe - Your order is delivered')
  end
end
