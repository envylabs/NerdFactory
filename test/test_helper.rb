ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl'

Factory.definition_file_paths = [ File.join(Rails.root, 'test', 'factories') ]
Factory.find_definitions

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end

class ActionController::TestCase
  setup     :mock_warden
  teardown  :cleanup_warden_env


  private


  def mock_warden
    warden = mock
    warden.stubs(:authenticate?)
    @controller.request.env['warden'] = warden
  end

  def cleanup_warden_env
    @controller.request.env.delete('warden')
  end
end
