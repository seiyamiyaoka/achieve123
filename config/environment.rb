# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings =
  {
  :user_name => "seiyamiyaoka@gmail.com",
  :password => ENV['GMAIL_PASSWORD'],
  :domain => "smtp.gmail.com",
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
# -*- coding: utf-8 -*-
Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'seiyamiyaoka@gmail.com',
                          :password   => 'jennrhnbmdluzigv',
                          :enable_ssl => true
end
# {
#   :user_name => "app43545507@heroku.com",
#   :password => "ghny1a5d2306",
#   :domain => "heroku.com",
#   :address => "smtp.sendgrid.net",
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }
# config.action_mailer.default_url_options = { host: 'localhost:3000' }
#   config.action_mailer.delivery_method = :smtp
#   config.action_mailer.raise_delivery_errors = true
#   config.action_mailer.smtp_settings = {
#    :enable_starttls_auto => true,
#    :address => 'smtp.gmail.com',
#    :port => '587',
#    :domain => 'smtp.gmail.com',
#    :authentication => 'plain',
#    :user_name => 'seiyamiyaoka@gmail.com',
#    :password => ENV['GMAIL_PASSWORD']
# }
