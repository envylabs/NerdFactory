require 'test_helper'

class LayoutTest < ActionController::IntegrationTest

  test 'should include jquery in the application layout' do
    get '/'
    assert_match 'jquery.js', response.body
  end

end
