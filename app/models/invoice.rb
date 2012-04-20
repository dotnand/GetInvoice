class Invoice < ActiveRecord::Base
  belongs_to :account
  belongs_to :admin_user, :foreign_key => 'creator_id'
  has_many :line_items
  accepts_nested_attributes_for :line_items
  validates :account_id, :invoice_date, :presence => true
  attr_accessible :account_id, :discount, :creator_id, :grand_total, :line_items_attributes, :invoice_date, :shipping_cost, :status, :tax, :total
  after_save :calculate_total
  
  
  def calculate_total
	tot = 0
	line_items. each do |line|
		tot += line.total.to_f
	end
	dis = tot.to_f - (tot.to_f* discount.to_f/100)
	tax = dis + (dis * tax.to_f/100)
	g_tot = tax + shipping_cost.to_f
	self.update_column(:total, tot)
	self.update_column(:grand_total, g_tot)  #this update_column used bcoz skip callback 
  end
end
