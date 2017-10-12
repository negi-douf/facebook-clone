class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail.subject
  #
  def sendmail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
