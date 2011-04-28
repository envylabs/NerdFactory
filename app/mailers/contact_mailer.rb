class ContactMailer < ActionMailer::Base
  default :from => "no-reply@nerdfactory.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.actionmailer.contact_mailer.notification.subject
  #
  def notification(contact)
    @contact = contact

    mail :to => @contact.email,
      :subject => @contact.subject,
      :body => @contact.body
  end
end
