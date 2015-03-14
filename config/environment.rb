# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => Settings.mailgun_domain,
  :user_name => Settings.mailgun_user_name,
  :password => Settings.mailgun_password
}

