class Invoice < ActiveRecord::Base
  belongs_to :account
  belongs_to :admin_user, :foreign_key => 'creator_id'
  has_many :line_items
  has_many :massages
  accepts_nested_attributes_for :line_items
  validates :account_id, :invoice_date, :presence => true
  attr_accessible :account_id, :discount, :creator_id, :grand_total, :line_items_attributes, :invoice_date, :shipping_cost, :status, :tax, :total
  after_save :calculate_total
  
  
  def calculate_total
    tot = 0
    line_items. each do |line|
      tot += line.total.to_f
    end
    tax_t = tot.to_f + (tot.to_f * tax.to_f/100.to_f)
    g_tot = tax_t + shipping_cost.to_f
    self.update_column(:total, tot)
    self.update_column(:grand_total, g_tot)  #this update_column used bcoz skip callback 
  end
  
  def paypal_url(return_url, notify_url)
    values = {
      :business => 'seller_1334905018_biz@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
    :notify_url => notify_url,
    :shipping => shipping_cost,
    :tax_cart => (tax.to_f/100)*total.to_f
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
