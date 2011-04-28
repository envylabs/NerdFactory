require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  setup do
    @product = Factory(:product)
  end

  test 'index action calls where on Product' do
    active = Product.where(:active => true)
    Product.expects(:where).with(:active => true).returns(active)
    get :index
  end

  test 'index action calls respond_with' do
    @controller.expects(:respond_with)
    get :index
  end

  test 'show action calls respond_with' do
    @controller.expects(:respond_with)
    get :show, :id => @product.id
  end

  test 'index action returns html' do
    get :index
    assert_response :success
    assert_equal "text/html", response.content_type
  end

  test 'show action returns html' do
    get :show, :id => @product.id
    assert_response :success
    assert_equal "text/html", response.content_type
  end

  test 'index action returns xml' do
    get :index, :format => 'xml'
    assert_response :success
    assert_equal "application/xml", response.content_type
    assert_equal [@product].to_xml, response.body
  end

  test 'show action returns xml' do
    get :show, :id => @product.id, :format => 'xml'
    assert_response :success
    assert_equal "application/xml", response.content_type
    assert_equal @product.to_xml, response.body
  end

end
