class UserMailer < ActionMailer::Base
  default :from => "herenand@gmail.com"
  
  def send_email(contact)
    @contact = contact
    mail(:to => @contact.account.email, :subject => "Invoice")
  end
end
