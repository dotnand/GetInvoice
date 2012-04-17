class Invoice < ActiveRecord::Base
  belongs_to :account
  belongs_to :admin_user, :foreign_key => 'creator_id'
  has_many :line_items
  accepts_nested_attributes_for :line_items
  validates :account_id, :invoice_date, :presence => true
  attr_accessible :account_id, :discount, :creator_id, :invoice_date, :shipping_cost, :status, :tax, :total
end
