class ApplicationMailer < ActionMailer::Base
  default from: 'everybody@appacademy.io'
  layout 'mailer'

  def welcome_email(user)
    "hi"
  end
end
