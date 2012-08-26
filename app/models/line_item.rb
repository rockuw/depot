class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :integer, :integer, :product_id, :product, :cart, :quantity, :price

  belongs_to :product
  belongs_to :cart

  def total_price
    quantity * price
  end
end
