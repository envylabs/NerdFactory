require 'test_helper'

class RoutesTest < ActionController::IntegrationTest
  ##
  # this is the way Rails provides for testing routes
  # unfortunately, this approach was not working at the time of writing
  #assert_generates '/', :controller => 'products', :action => 'index'

  ##
  # the follow is a work-around since the above is not working
  def test_root_route
    assert_equal  '/', root_path
  end

  def test_products_index_is_rendered_for_root_route
    get           '/'
    assert_tag    :body, :attributes => { :class => /products-index/ }
  end

  def test_products_index_is_rendered_for_store_route
    get           '/store'
    assert_tag    :body, :attributes => { :class => /products-index/ }
  end

end
