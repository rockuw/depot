require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "RockU's Bookstore Order Confirmation", mail.subject
    assert_equal ["rockuw@gmail.com"], mail.to
    assert_equal ["rockuw_smtp@sina.com"], mail.from
    assert_match "Dear", mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped(orders(:one))
    assert_equal "RockU's Bookstore Order Shipped", mail.subject
    assert_equal ["rockuw@gmail.com"], mail.to
    assert_equal ["rockuw_smtp@sina.com"], mail.from
    assert_match "Dear", mail.body.encoded
  end

end
