class Massage < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :account
  belongs_to :admin_user
  validates :contents, :presence => true
  
  attr_accessible :account_id, :admin_user_id, :contents, :invoice_id
  after_create :send_invoice_mail
  def send_invoice_mail
    UserMailer.send_email(self).deliver
  end
end
