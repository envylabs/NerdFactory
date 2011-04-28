require 'test_helper'

class CartTest < ActionController::IntegrationTest

  setup do
    @product = Factory(:product)
    post cart_path, :product_id => @product.id
  end

  test 'should use ajax to update line item quantity' do
    get cart_path

    assert_tag :tag => 'a',
      :attributes => {:class => 'buttonMore', :'data-remote' => 'true'}
    assert_tag :tag => 'a',
      :attributes => {:class => 'buttonLess', :'data-remote' => 'true'}
  end

  test 'should add confirmation to remove link' do
    get cart_path

    assert_tag :tag => 'span',
      :attributes => {:class => 'buttonRemove'},
      :ancestor => {:tag => 'a', :attributes => {'data-confirm' => 'Are you sure you want to remove this item?'}}
  end

end
