require 'test_helper'

class ExtraRoutesTest < ActionController::IntegrationTest

  test '/:id matches /products/:id' do
    product = Factory(:product)
    assert_recognizes({:controller => 'products', :action => 'show', :id => "#{product.id}"}, "/#{product.id}")
  end

  test 'only numeric matches the id route' do
    assert_raise ActionController::RoutingError do
      # hack hack hack...
      # plain ol' "get '/abc'" returns 404, while the following returns 500
      assert_recognizes({}, "/abc")
    end
  end

end
