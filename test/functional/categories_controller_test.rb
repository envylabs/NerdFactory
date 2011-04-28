require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  test 'show action calls active scope on Product' do
    category = Factory(:category)
    products = mock
    products.expects(:active).returns(Product.active)
    Category.any_instance.expects(:products).returns(products)
    get :show, :id => category.id
  end

end
