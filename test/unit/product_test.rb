require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'should have active named scope' do
    scope = Product.active
    assert_equal ActiveRecord::Relation, scope.class
    assert_equal Product.where(:active => true).where_values, scope.where_values
  end

end
