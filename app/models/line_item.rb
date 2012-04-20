class LineItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :product
  attr_accessible :quantity, :total, :invoice_id, :product_id, :unit_price
end
