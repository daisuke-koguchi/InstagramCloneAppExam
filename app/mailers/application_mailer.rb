class ApplicationMailer < ActionMailer::Base
  default from: ENV['POST_MAIL']
  layout 'mailer'
end
