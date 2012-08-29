class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type

  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]

  validates :name, :email, :address, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
end
