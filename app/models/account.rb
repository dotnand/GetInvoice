class Account < ActiveRecord::Base
  belongs_to :admin_user
  has_many :invoices
  has_many :massages
  validates :display_name, :email, :presence => true
  attr_accessible :display_name, :email, :phone, :address, :admin_user_id
end
