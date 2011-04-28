require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase

  setup do
    @user   = Factory(:user, :email => 'FIND_ME@MAIL.COM')
    @order  = Factory(:order, :user => @user)
    @mail   = OrderMailer.purchase_confirmation(@order)
  end

  test 'from email address set to orders@nerdfactory.com' do
    assert_equal ['orders@nerdfactory.com'], @mail.from
  end

  test 'to email address set to email address of the user' do
    assert_equal ['FIND_ME@MAIL.COM'], @mail.to
  end

  test 'receipt.pdf is attached to the email' do
    assert @mail.attachments.map(&:filename).include?('receipt.pdf')
  end

  test 'includes order total' do
    assert_match "$#{@order.price}", @mail.body.encoded
  end

end
