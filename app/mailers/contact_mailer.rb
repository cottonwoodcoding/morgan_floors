class ContactMailer < ActionMailer::Base
  include SendGrid

  default from: ENV['mail_from']

  def send_feedback(email, name, content)
    @email = email
    @name = name
    @content = content
    mail(:to => ENV['mail_to'], :subject => "#{name} is trying to contact you via your website.")
  end
end
