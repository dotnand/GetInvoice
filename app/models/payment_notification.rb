class PaymentNotification < ActiveRecord::Base
  belongs_to :invoice
  serialize :params
  after_create :mark_cart_as_purchased
  attr_accessible :params, :invoice_id, :status, :transaction_id
  
  def mark_cart_as_purchased
    if status == "Completed"
      invoice.update_attribute(:purchased_at, Time.now)
    end
  end
end
