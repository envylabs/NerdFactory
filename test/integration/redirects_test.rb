require 'test_helper'

class RedirectsTest < ActionController::IntegrationTest

  test 'should redirect index from /teas to /products' do
    get '/teas'
    assert_response :redirect

    follow_redirect!
    assert_equal '/products', path
  end

  test 'should redirect show from /teas/:id to /products/:id' do
    product = Factory(:product)

    get "/teas/#{product.id}"
    assert_response :redirect

    follow_redirect!
    assert_equal "/products/#{product.id}", path
  end

end
