class Product < ActiveRecord::Base
  belongs_to :admin_user
  validates :name, :unit_price, :key, :presence => true
  attr_accessible :name, :unit_price, :brand, :quantity, :comments, :key
end
