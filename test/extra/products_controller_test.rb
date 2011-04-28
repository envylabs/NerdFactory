require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  setup do
    @product = Factory(:product)
  end

  test 'index action returns json' do
    get :index, :format => 'json'
    assert_response :success
    assert_equal "application/json", response.content_type
    assert_equal ActiveSupport::JSON.encode([@product]), response.body
  end

  test 'show action returns json' do
    get :show, :id => @product.id, :format => 'json'
    assert_response :success
    assert_equal "application/json", response.content_type
    assert_equal @product.to_json, response.body
  end

end
