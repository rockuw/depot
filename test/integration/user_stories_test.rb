require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  fixtures :products

  test "buying a product" do
    LineItem.delete_all 
    Order.delete_all
    a_book = products(:one)

    # go to the store
    get "/"
    assert_response :success
    assert_template "index"

    # add a book to cart
    xhr :post, '/line_items', :product_id => a_book.id
    assert_response :success
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal a_book, cart.line_items[0].product

    # go to checkout
    get "/orders/new"
    assert_response :success
    assert_template "new"

    # submit an order
    post_via_redirect "/orders",
      :order => { :name => 'Tianlong Wu',
        :address => 'Harbin',
        :email => 'rockuw@gmail.com',
        :pay_type => 'Check'}
    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    # verify the order is created correctly
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal "Tianlong Wu", order.name
    assert_equal "Harbin", order.address
    assert_equal "rockuw@gmail.com", order.email
    assert_equal "Check", order.pay_type

    assert_equal 1, order.line_items.size
    assert_equal a_book, order.line_items[0].product

    # test the mail is right
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["rockuw@gmail.com"], mail.to
    assert_equal 'rockuw <rockuw_smtp@sina.com>', mail[:from].value
    assert_equal "RockU's Bookstore Order Confirmation", mail.subject
  end  
end
