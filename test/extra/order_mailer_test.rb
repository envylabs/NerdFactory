require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase

  setup do
    @user     = Factory(:user, :email => 'FIND_ME@MAIL.COM')
    @product  = Factory(:product)
    @order    = Factory(:order, :user => @user)
    Factory(:line_item, :product => @product, :order => @order)
    picture   = mock
    picture.stubs(:original_filename).returns('PRODUCT_PICTURE.jpg')
    picture.stubs(:path).returns(Rails.root.join('test/fixtures/files/product_picture.jpg'))
    Product.any_instance.stubs(:picture).returns(picture)
    @mail     = OrderMailer.purchase_confirmation(@order)
  end

  test 'product image is attached to the email' do
    assert @mail.attachments.map(&:filename).include?('PRODUCT_PICTURE.jpg')
  end

end
