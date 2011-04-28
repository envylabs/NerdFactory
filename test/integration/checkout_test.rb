require 'test_helper'

class CheckoutTest < ActionController::IntegrationTest

  setup do
    @product = Factory(:product)
    post cart_path, :product_id => @product.id
    CheckoutController.any_instance.stubs(:authenticate_user!).returns(true)
  end

  test 'should deliver purchase confirmation email' do
    mail = mock
    mail.expects(:deliver)
    OrderMailer.expects(:purchase_confirmation).returns(mail)

    post checkout_path
  end

end
