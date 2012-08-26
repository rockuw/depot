class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :integer, :integer, :product_id, :product, :cart

  belongs_to :product
  belongs_to :cart
end
