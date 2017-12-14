class ApplicationMailer < ActionMailer::Base
  default from: I18n.translate("mailer.from")
  layout 'mailer'
end
