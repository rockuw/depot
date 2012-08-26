class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :integer, :integer, :product_id, :product, :cart, :quantity

  belongs_to :product
  belongs_to :cart

  def total_price
    quantity * product.price
  end
end
