require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_view/railtie'


Bundler.require(*Rails.groups)

module InstaSearch
  class Application < Rails::Application

  end
end
