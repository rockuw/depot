require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "product is not valid without a unique title" do
    product = Product.new(:title => products(:one).title,
                          :description => 'yyy',
                          :price => 1,
                          :image_url => 'fred.gif')
    assert !product.save
  end
end
